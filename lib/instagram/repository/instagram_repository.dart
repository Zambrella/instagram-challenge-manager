import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/common/appwrite_ids.dart';
import 'package:instagram_models/instagram_models.dart';

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

  Future<List<InstagramPostDto>> getUserPosts() async {
    log(
      'Fetching user posts',
      name: 'InstagramLoginRepository',
    );

    final result = await _functions.createExecution(
      functionId: AppwriteIds.instagramUserPostsFunctionId,
    );
    log(
      'Response: ${result.responseBody}',
      name: 'InstagramLoginRepository',
    );
    if (result.responseStatusCode != 200) {
      log(
        'Failed to get user posts: ${result.responseStatusCode} - ${result.errors}',
        name: 'InstagramLoginRepository',
      );
      throw Exception('Failed to get user posts: ${result.errors}');
    }
    final data = jsonDecode(result.responseBody) as Map<String, dynamic>;
    log(
      'Data: $data',
      name: 'InstagramLoginRepository',
    );
    final posts = (data['posts'] as List)
        .map((e) => InstagramPostDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return posts;
  }

  Future<InstagramPostDto> getPost(String postId) async {
    log(
      'Fetching user posts',
      name: 'InstagramLoginRepository',
    );

    final result = await _functions.createExecution(
      functionId: AppwriteIds.instagramPostFunctionId,
      body: jsonEncode({
        'postId': postId,
      }),
    );
    log(
      'Response: ${result.responseBody}',
      name: 'InstagramLoginRepository',
    );
    if (result.responseStatusCode != 200) {
      log(
        'Failed to get post: ${result.responseStatusCode} - ${result.errors}',
        name: 'InstagramLoginRepository',
      );
      throw Exception('Failed to get post with id $postId: ${result.errors}');
    }
    final data = jsonDecode(result.responseBody) as Map<String, dynamic>;
    log(
      'Data: $data',
      name: 'InstagramLoginRepository',
    );
    final post =
        InstagramPostDto.fromJson(data['post'] as Map<String, dynamic>);
    return post;
  }

  Future<List<InstagramPostDto>> getChallengeEntries({
    required String challengeId,
    required List<String>? hashtags,
    required List<String>? accounts,
    required int challengeStartedAt,
  }) async {
    log(
      'Fetching instagram posts for challenge: $challengeId',
      name: 'InstagramLoginRepository',
    );

    final result = await _functions.createExecution(
      functionId: AppwriteIds.challengeEntriesFunctionId,
      body: jsonEncode(
        {
          'hashtags': hashtags,
          'accounts': accounts,
          'challengeStartedAt': challengeStartedAt,
        },
      ),
    );
    log(
      'Response: ${result.responseBody}',
      name: 'InstagramLoginRepository',
    );
    if (result.responseStatusCode != 200) {
      log(
        'Failed to get posts for challenge: ${result.responseStatusCode} - ${result.errors}',
        name: 'InstagramLoginRepository',
      );
      throw Exception('Failed to get user posts: ${result.errors}');
    }
    final data = jsonDecode(result.responseBody) as Map<String, dynamic>;
    log(
      'Data: $data',
      name: 'InstagramLoginRepository',
    );
    final posts = (data['posts'] as List)
        .map((e) => InstagramPostDto.fromJson(e as Map<String, dynamic>))
        .toList();
    return posts;
  }
}
