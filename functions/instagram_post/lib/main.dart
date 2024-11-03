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

  final bodyData = context.req.bodyJson as Map<String, dynamic>;
  final postId = bodyData['postId'] as String;
  context.log('Post id: $postId');

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

  // Fetch the post
  final uri = Uri.parse(
    'https://graph.instagram.com/$postId?fields=caption,comments_count,like_count,id,media_type,media_url,permalink,thumbnail_url,timestamp,username&access_token=$accessToken',
  );
  context.log('Fetching post with id: $postId');
  final response = await http.get(uri);
  final data = jsonDecode(response.body) as Map<String, dynamic>;
  final instagramPostDto = InstagramPostDto.fromJson(data);
  context.log('Fetched post: $instagramPostDto');

  return context.res.json(
    {
      'post': instagramPostDto.toJson(),
    },
  );
}
