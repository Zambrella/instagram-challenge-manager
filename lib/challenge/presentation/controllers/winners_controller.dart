import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/prize.dart';
import 'package:instagram_challenge_manager/challenge/providers/challenge_service_provider.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/instagram/providers/challenge_entries_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'winners_controller.g.dart';

typedef ChallengeWinners = Map<InstagramPost, Prize>;

@riverpod
class WinnersController extends _$WinnersController {
  @override
  Future<ChallengeWinners> build(Challenge challenge) async {
    final posts = await ref.watch(challengeEntriesProvider(challenge).future);
    return _convertChallengeWinners(posts, challenge);
  }

  /// Helper method to convert a lists of posts and a challenge into a map of posts to prizes.
  ChallengeWinners _convertChallengeWinners(
    List<InstagramPost> posts,
    Challenge challenge,
  ) {
    return challenge.winners.map(
      (postId, prizeId) => MapEntry(
        posts.firstWhere((post) => post.id == postId),
        challenge.prizes.firstWhere((prize) => prize.id == prizeId),
      ),
    );
  }

  Future<void> drawWinners(Challenge challenge) async {
    try {
      state = const AsyncLoading();
      await Future.delayed(const Duration(seconds: 2));
      final newChallenge = challenge.drawWinners();
      await ref.read(challengeServiceProvider).updateChallenge(newChallenge);
      final posts = await ref.watch(challengeEntriesProvider(challenge).future);
      final winners = _convertChallengeWinners(posts, newChallenge);
      state = AsyncData(winners);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
