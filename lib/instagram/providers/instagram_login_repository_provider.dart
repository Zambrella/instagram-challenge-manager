import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/instagram/repository/instagram_login_repository.dart';
import 'package:instagram_challenge_manager/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instagram_login_repository_provider.g.dart';

@Riverpod(keepAlive: true)
InstagramLoginRepository instagramLoginRepository(Ref ref) {
  return InstagramLoginRepository(
    ref.watch(appwriteFunctionsClientProvider),
  );
}
