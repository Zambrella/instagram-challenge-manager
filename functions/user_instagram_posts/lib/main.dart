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
  final postIdsUri = Uri.parse(
    'https://graph.instagram.com/$userId/media?access_token=$accessToken',
  );
  final response = await http.get(postIdsUri);
  final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
  final responseData = decodedResponse['data'] as List;
  final pagination = decodedResponse['paging'] as Map<String, dynamic>;
  final postIds = responseData.map((e) => e['id'] as String).toList();
  context.log('Post IDs: $postIds');

  final postUris = postIds.map(
    (id) => Uri.parse(
      'https://graph.instagram.com/$id?fields=caption,id,media_type,media_url,permalink,thumbnail_url,timestamp&access_token=$accessToken',
    ),
  );

  final posts = await Future.wait(
    postUris.map((uri) async {
      final response = await http.get(uri);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final instagramPostDto = InstagramPostDto.fromJson(data);
      return instagramPostDto;
    }),
    eagerError: true,
  );
  context.log('Returning ${posts.length} posts');

  // Return response
  return context.res.json(
    {
      'posts': posts.map((post) => post.toJson()).toList(),
    },
  );
}
