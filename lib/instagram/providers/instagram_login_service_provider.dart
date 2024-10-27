import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_login_service.abs.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_login_repository_provider.dart';
import 'package:instagram_challenge_manager/instagram/service/instagram_login_service.impl.dart';
import 'package:instagram_challenge_manager/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instagram_login_service_provider.g.dart';

@Riverpod(keepAlive: true)
InstagramLoginService instagramLoginService(Ref ref) {
  return InstagramLoginServiceImpl(
    ref.watch(authRepositoryProvider),
    ref.watch(instagramLoginRepositoryProvider),
  );
}
