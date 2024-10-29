import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:instagram_challenge_manager/common/appwrite_ids.dart';

class InstagramRepository {
  const InstagramRepository(this._functions);

  final Functions _functions;

  /// Using the [code] provided by the Instagram API,
  /// send it to the server and log the user in.
  /// Returns a [Future] with a [String] token and [String] userId
  /// which can be used to create a session in the app.
  Future<(String token, String userId)> loginWithCode(String code) async {
    log(
      'Logging in with code: $code',
      name: 'InstagramLoginRepository',
    );
    final body = jsonEncode(
      {
        'code': code,
      },
    );

    final result = await _functions.createExecution(
      functionId: AppwriteIds.instagramLoginFunctionId,
      body: body,
    );
    log(
      'Response: ${result.responseBody}',
      name: 'InstagramLoginRepository',
    );
    if (result.responseStatusCode != 200) {
      log(
        'Failed to login with code: ${result.responseStatusCode} - ${result.errors}',
        name: 'InstagramLoginRepository',
      );
      throw Exception('Failed to login with code: ${result.errors}');
    }
    final data = jsonDecode(result.responseBody) as Map<String, dynamic>;
    log(
      'Data: $data',
      name: 'InstagramLoginRepository',
    );
    return (data['token'] as String, data['userId'] as String);
  }
}
