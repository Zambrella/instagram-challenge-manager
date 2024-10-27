import 'dart:developer';

import 'package:auth_core/auth_core.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_login_exceptions.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_login_service.abs.dart';
import 'package:instagram_challenge_manager/instagram/repository/instagram_login_repository.dart';

class InstagramLoginServiceImpl implements InstagramLoginService {
  const InstagramLoginServiceImpl(
    this._authRepository,
    this._instagramLoginRepository,
  );

  final AuthRepository _authRepository;
  final InstagramLoginRepository _instagramLoginRepository;

  @override
  Future<void> loginWithUrlCode(String url) async {
    final code = _parseCode(url);
    await _instagramLoginRepository.loginWithCode(code);
    // await _authRepository.createSession();
  }

  /// Given a valid [url] with the code query parameter,
  /// extracts the code from the [url] and returns it.
  String _parseCode(String url) {
    try {
      log(
        'Redirect url with code: $url',
        name: 'InstagramLoginServiceImpl',
      );
      final uri = Uri.parse(url);
      if (uri.queryParameters.containsKey('code')) {
        final rawCode = uri.queryParameters['code']!;
        log(
          'Code=$rawCode',
          name: 'InstagramLoginServiceImpl',
        );
        late final String formattedCode;
        if (rawCode.contains('#')) {
          // Strip the `#_` from the end of the code.
          formattedCode = rawCode.substring(0, rawCode.indexOf('#'));
        } else {
          formattedCode = rawCode;
        }
        log(
          'FormattedCode=$formattedCode',
          name: 'InstagramLoginServiceImpl',
        );
        return formattedCode;
      } else if (uri.queryParameters.containsKey('error')) {
        final error = uri.queryParameters['error']!;
        final errorReason = uri.queryParameters['error_reason']!;
        final errorDescription = uri.queryParameters['error_description']!;
        log(
          'error=$error, errorReason=$errorReason, errorDescription=$errorDescription',
          name: 'InstagramLoginServiceImpl',
        );
        if (error == 'access_denied') {
          throw InstagramLoginCancelledException(
            error: error,
            reason: errorReason,
            description: errorDescription,
            stackTrace: StackTrace.current,
          );
        } else {
          throw InstagramLoginUnknownException(
            error: error,
            reason: errorReason,
            description: errorDescription,
            stackTrace: StackTrace.current,
          );
        }
      } else {
        throw FormatException('Invalid URL: $url');
      }
    } catch (e) {
      rethrow;
    }
  }
}