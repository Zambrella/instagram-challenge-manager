import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/providers/challenge_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_provider.g.dart';

@riverpod
FutureOr<Challenge> challenge(Ref ref, String challengeId) {
  return ref.watch(challengeServiceProvider).getChallenge(challengeId);
}
