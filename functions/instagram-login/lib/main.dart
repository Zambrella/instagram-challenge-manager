import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_login/models/long_lived_access_token.dart';

// This Appwrite function will be executed every time your function is triggered
Future<dynamic> main(final context) async {
  // You can use the Appwrite SDK to interact with other services
  // For this example, we're using the Users service
  final client = Client()
      .setEndpoint(Platform.environment['APPWRITE_FUNCTION_API_ENDPOINT'] ?? '')
      .setProject(Platform.environment['APPWRITE_FUNCTION_PROJECT_ID'] ?? '')
      .setKey(context.req.headers['x-appwrite-key'] ?? '');

  final users = Users(client);
  final db = Databases(client);

  final clientId = Platform.environment['INSTAGRAM_CLIENT_ID']!;
  final secret = Platform.environment['INSTAGRAM_SECRET']!;
  final redirectUrl = Platform.environment['INSTAGRAM_REDIRECT_URL']!;

  final data = context.req.bodyJson as Map<String, dynamic>;
  final code = data['code'] as String;
  context.log('Code: $code');

  final response = await http.post(
    Uri.parse('https://api.instagram.com/oauth/access_token'),
    body: {
      'client_id': clientId,
      'client_secret': secret,
      'grant_type': 'authorization_code',
      'redirect_uri': redirectUrl,
      'code': code,
    },
  );

  final responseData = jsonDecode(response.body) as Map<String, dynamic>;
  context.log('Response: $responseData');

  late final String accessToken;
  late final String instagramUserId;
  if (responseData.containsKey('access_token')) {
    accessToken = responseData['access_token'] as String;
    instagramUserId = responseData['user_id'] as String;
    final permissions = (responseData['permissions'] as List).cast<String>();
    context.log('Access token: $accessToken');
    context.log('Instagram User ID: $instagramUserId');
    context.log('Permissions: $permissions');
  } else if (responseData.containsKey('error')) {
    final code = responseData['code'] as String;
    final errorType = responseData['error_type'] as String;
    final errorMessage = responseData['error_message'] as String;
    context.log('Error Code: $code');
    context.log('Error Type: $errorType');
    context.log('Error Message: $errorMessage');
    context.error(responseData);
    return context.res.json(responseData);
  } else {
    context.error('Unknown error');
    return context.res.json({'error': 'Unknown error'});
  }

  // Continue to get long lived token and log user in
  late final User user;
  try {
    user = await users.get(userId: instagramUserId);
    context.log('User with ${user.$id} found');
  } catch (e) {
    user = await users.create(
      userId: instagramUserId,
    );
    context.log('User with ${user.$id} created');
  }
  final token = await users.createToken(
    userId: user.$id,
  );

  context.log('Getting long lived token');
  final longLivedToken = await _getLongLivedToken(
    shortLivedToken: accessToken,
    secret: secret,
    userId: instagramUserId,
  );
  context.log('Long lived token fetched: ${longLivedToken.token}');

  context.log('Saving token to database');
  await db.createDocument(
    databaseId: Platform.environment['APPWRITE_DATABASE_ID']!,
    collectionId: Platform.environment['APPWRITE_COLLECTION_ID']!,
    documentId: ID.unique(),
    data: longLivedToken.toJson(),
    permissions: [
      Permission.read(Role.user(user.$id)),
      Permission.delete(Role.user(user.$id)),
    ],
  );
  context.log('Token saved to database');

  // TODO: Get some user info from Instagram? Avatar?

  return context.res.json({
    'token': token,
    'userId': user.$id,
  });
}

/// Given a short lived [token], returns a long lived access token.
Future<AccessToken> _getLongLivedToken({
  required String shortLivedToken,
  required String secret,
  required String userId,
}) async {
  final uri = Uri.parse(
    'https://graph.instagram.com/access_token?grant_type=ig_exchange_token&client_secret=$secret&access_token=$shortLivedToken',
  );
  final response = await http.get(uri);
  final responseData = jsonDecode(response.body) as Map<String, dynamic>;
  final longLivedTokenResponse = AccessTokenResponse.fromJson(responseData);
  final longLivedToken = AccessToken.fromResponse(
    response: longLivedTokenResponse,
    userId: userId,
  );
  return longLivedToken;
}
