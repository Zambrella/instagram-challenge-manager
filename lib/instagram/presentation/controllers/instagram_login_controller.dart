import 'dart:async';

import 'package:instagram_challenge_manager/app_dependencies.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_info.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_login_exceptions.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_login_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instagram_login_controller.g.dart';

@riverpod
class InstagramLoginController extends _$InstagramLoginController {
  @override
  FutureOr<void> build() {}

  /// Given a valid [url] with a code, it will be validated and send to the server.
  Future<void> validateCodeAndLogin(String url) async {
    state = const AsyncLoading();
    try {
      final _ =
          await ref.watch(instagramLoginServiceProvider).loginWithUrlCode(url);
    } on InstagramLoginCancelledException catch (_) {
      state = const AsyncData(null);
    } on FormatException catch (e, st) {
      state = AsyncError(e, st);
    } catch (e, st) {
      unawaited(
        ref.watch(errorLoggingRepositoryProvider).logException(
              e.toString(),
              error: e,
              stackTrace: st,
            ),
      );
      state = AsyncError(e, st);
    }
  }
}
