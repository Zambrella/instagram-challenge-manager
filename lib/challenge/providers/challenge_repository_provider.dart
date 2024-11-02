import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/repository/challenge_repository.dart';
import 'package:instagram_challenge_manager/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ChallengeRepository challengeRepository(Ref ref) {
  return ChallengeRepository(
    ref.watch(appwriteAccountClientProvider),
    ref.watch(appwriteDatabaseClientProvider),
  );
}
