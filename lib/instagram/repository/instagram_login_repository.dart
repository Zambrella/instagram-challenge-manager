import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:instagram_challenge_manager/common/appwrite_ids.dart';

class InstagramLoginRepository {
  const InstagramLoginRepository(this._functions);

  final Functions _functions;

  /// Using the [code] provided by the Instagram API,
  /// send it to the server and log the user in.
  /// Returns a [Future] with a [String] token and [String] userId
  /// which can be used to create a session in the app.
  Future<(String token, String userId)> loginWithCode(String code) async {
    final body = jsonEncode(
      {
        'code': code,
      },
    );

    final result = await _functions.createExecution(
      functionId: AppwriteIds.instagramLoginFunctionId,
      body: body,
    );
    if (result.responseStatusCode != 200) {
      throw Exception('Failed to login with code: ${result.errors}');
    }
    final data = jsonDecode(result.responseBody) as Map<String, dynamic>;
    return (data['token'] as String, data['userId'] as String);
  }
}
