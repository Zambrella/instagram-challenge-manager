import 'dart:async';

import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/providers/all_challenges_provider.dart';
import 'package:instagram_challenge_manager/challenge/providers/challenge_provider.dart';
import 'package:instagram_challenge_manager/challenge/providers/challenge_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_new_challenge_controller.g.dart';

@riverpod
class CreateNewChallengeController extends _$CreateNewChallengeController {
  @override
  FutureOr<void> build() {}

  Future<void> createNewChallenge(Challenge challenge) async {
    state = const AsyncLoading();
    try {
      final _ =
          await ref.watch(challengeServiceProvider).createChallenge(challenge);
      ref.invalidate(allChallengesProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateChallenge(Challenge challenge) async {
    state = const AsyncLoading();
    try {
      final _ =
          await ref.watch(challengeServiceProvider).updateChallenge(challenge);
      ref
        ..invalidate(allChallengesProvider)
        ..invalidate(challengeProvider(challenge.id));
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
