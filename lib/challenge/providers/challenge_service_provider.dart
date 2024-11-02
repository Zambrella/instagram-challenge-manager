import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge_service.abs.dart';
import 'package:instagram_challenge_manager/challenge/providers/challenge_repository_provider.dart';
import 'package:instagram_challenge_manager/challenge/service/challenge_service.impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_service_provider.g.dart';

@Riverpod(keepAlive: true)
ChallengeService challengeService(Ref ref) {
  return ChallengeServiceImpl(
    ref.watch(challengeRepositoryProvider),
  );
}
