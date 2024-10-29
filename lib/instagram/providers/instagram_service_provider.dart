import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_service.abs.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_repository_provider.dart';
import 'package:instagram_challenge_manager/instagram/service/instagram_service.impl.dart';
import 'package:instagram_challenge_manager/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instagram_service_provider.g.dart';

@Riverpod(keepAlive: true)
InstagramService instagramService(Ref ref) {
  return InstagramServiceImpl(
    ref.watch(authRepositoryProvider),
    ref.watch(instagramRepositoryProvider),
  );
}
