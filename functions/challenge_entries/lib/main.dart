import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_models/instagram_models.dart';

// This Appwrite function will be executed every time your function is triggered
Future<dynamic> main(final context) async {
  // You can use the Appwrite SDK to interact with other services
  // For this example, we're using the Users service
  final client = Client()
      .setEndpoint(Platform.environment['APPWRITE_FUNCTION_API_ENDPOINT'] ?? '')
      .setProject(Platform.environment['APPWRITE_FUNCTION_PROJECT_ID'] ?? '');

  if (context.req.headers['x-appwrite-user-jwt'] != null) {
    client.setJWT(context.req.headers['x-appwrite-user-jwt']);
  } else {
    return context.res.text(
        "Access denied: This function requires authentication. Please sign in to continue.");
  }

  final db = Databases(client);

  // Get user id
  final userId = context.req.headers['x-appwrite-user-id']!;
  context.log('Executing function as user $userId');

  // Arguments
  final bodyData = context.req.bodyJson as Map<String, dynamic>;
  final requiredHashtags = (bodyData['hashtags'] as List?)?.cast<String>();
  final requiredAccounts = (bodyData['accounts'] as List?)?.cast<String>();
  final challengeStartedAt = DateTime.fromMillisecondsSinceEpoch(
      bodyData['challengeStartedAt'] as int);
  context.log(
    'Required hashtags: $requiredHashtags, required accounts: $requiredAccounts, challenge started at: $challengeStartedAt',
  );

  // Get their access token
  final documentList = await db.listDocuments(
    databaseId: Platform.environment['APPWRITE_DATABASE_ID']!,
    collectionId: Platform.environment['APPWRITE_COLLECTION_ID']!,
    queries: [
      Query.equal('userId', userId),
    ],
  );
  if (documentList.total != 1) {
    return context.res
        .text("Error: User not found. Please sign in to continue.");
  }
  final accessToken = documentList.documents[0].data['token'];
  context.log('Successfully fetched access token');

  // Call endpoint
  final tagsUri = Uri.parse(
    'https://graph.instagram.com/$userId/tags?fields=caption,comments_count,like_count,id,media_type,media_url,permalink,thumbnail_url,timestamp,username&access_token=$accessToken',
  );
  final response = await http.get(tagsUri);
  final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
  final responseData = decodedResponse['data'] as List;
  final pagination = decodedResponse['paging'] as Map<String, dynamic>;
  final posts = responseData.map((e) => InstagramPostDto.fromJson(e)).toList();
  context.log('${posts.length} posts fetched with $userId tagged in them');

  // TODO: Fetch more posts back to the start of the challenge
  // TODO: Fetch posts from required accounts which are picked up from webhook data

  // Filter out posts that don't match the criteria
  if (requiredHashtags != null && requiredHashtags.isNotEmpty) {
    posts.removeWhere((post) {
      final caption = post.caption.toLowerCase();
      return !requiredHashtags.every(
        (hashtag) => caption.contains('#${hashtag.toLowerCase()}'),
      );
    });
  }

  if (requiredAccounts != null && requiredAccounts.isNotEmpty) {
    posts.removeWhere((post) {
      // Accounts mentions are always lower case.
      final caption = post.caption;
      return !requiredAccounts.every(
        (account) => caption.contains('@$account'),
      );
    });
  }

  // Return response
  return context.res.json(
    {
      'posts': posts.map((post) => post.toJson()).toList(),
    },
  );
}
