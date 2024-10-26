import 'package:instagram_challenge_manager/app_dependencies.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instagram_login_controller.g.dart';

@riverpod
class InstagramLoginController extends _$InstagramLoginController {
  @override
  FutureOr<void> build() {}

  /// Given a valid [url] with a code, it will be validated and send to the server.
  Future<void> validateCodeAndLogin(String url) async {
    state = const AsyncLoading();
    final logger = ref.read(loggerProvider);
    try {
      logger.i('Redirect url with code: $url');
      final uri = Uri.parse(url);
      if (uri.host == InstagramInfo.redirectUri.host) {
        if (uri.queryParameters.containsKey('code')) {
          final rawCode = uri.queryParameters['code']!;
          logger.i('Code=$rawCode');
          late final String formattedCode;
          if (rawCode.contains('#')) {
            // Strip the `#_` from the end of the code.
            formattedCode = rawCode.substring(0, rawCode.indexOf('#'));
          } else {
            formattedCode = rawCode;
          }
          logger.i('FormattedCode=$formattedCode');
          await Future.delayed(const Duration(seconds: 5));
          state = const AsyncData(null);
        } else {
          final error = uri.queryParameters['error']!;
          final errorReason = uri.queryParameters['error_reason']!;
          final errorDescription = uri.queryParameters['error_description']!;
          logger.w(
            'error=$error, errorReason=$errorReason, errorDescription=$errorDescription',
          );
          if (error == 'access_denied') {
            state = const AsyncData(null);
          } else {
            state = AsyncError(error, StackTrace.current);
          }
        }
      }
    } on FormatException catch (e, st) {
      logger.e(e.message, error: e, stackTrace: st);
      state = AsyncError(e, st);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
