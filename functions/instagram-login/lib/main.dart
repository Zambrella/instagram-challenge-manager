import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:http/http.dart' as http;

// This Appwrite function will be executed every time your function is triggered
Future<dynamic> main(final context) async {
  // You can use the Appwrite SDK to interact with other services
  // For this example, we're using the Users service
  final client = Client()
      .setEndpoint(Platform.environment['APPWRITE_FUNCTION_API_ENDPOINT'] ?? '')
      .setProject(Platform.environment['APPWRITE_FUNCTION_PROJECT_ID'] ?? '')
      .setKey(context.req.headers['x-appwrite-key'] ?? '');

  final users = Users(client);

  final clientId = Platform.environment['INSTAGRAM_CLIENT_ID'];
  final secret = Platform.environment['INSTAGRAM_SECRET'];
  final redirectUrl = Platform.environment['INSTAGRAM_REDIRECT_URL'];

  final data = context.req.bodyJson as Map<String, dynamic>;
  final code = data['code'] as String;

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
  if (responseData
      case {
        'data': [
          {
            'access_token': final String accessToken,
            // Instagram App-scoped User ID (this can be used as a the identifier)
            'user_id': final String instagramUserId,
            'permissions': final List<dynamic> permissions,
          },
        ],
      }) {
    context.log('Access token: $accessToken');
    context.log('Instagram User ID: $instagramUserId');
    context.log('Permissions: $permissions');
  } else {
    context.log('Error: $responseData');
  }
  return context.res.empty();
}
