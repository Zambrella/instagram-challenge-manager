import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/app_dependencies.dart';
import 'package:instagram_challenge_manager/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@Riverpod(keepAlive: false)
FutureOr<void> login(Ref ref, String userId) async {
  await ref.read(purchasesRepositoryProvider).setUserId(userId);
  await ref.read(errorLoggingRepositoryProvider).setUserId(userId);
  await ref.read(analyticsRepositoryProvider).setUserId(userId);
}
