import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/providers/challenge_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_challenges_provider.g.dart';

@riverpod
FutureOr<List<Challenge>> allChallenges(Ref ref) {
  return ref.watch(challengeServiceProvider).getChallenges();
}
