import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/entry_status.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_entries_controller.g.dart';

@riverpod
class ChallengeEntriesController extends _$ChallengeEntriesController {
  @override
  FutureOr<Map<EntryStatus, List<InstagramPost>>> build(
    Challenge challenge,
  ) async {
    final posts = await ref
        .watch(instagramServiceProvider)
        .getChallengeEntries(challenge);
    final validPosts = posts
        .where((post) => challenge.validEntryIds.contains(post.id))
        .toList();
    final invalidPosts = posts
        .where((post) => challenge.invalidEntryIds.contains(post.id))
        .toList();
    final pendingPosts = posts
        .where(
          (post) =>
              !challenge.validEntryIds.contains(post.id) &&
              !challenge.invalidEntryIds.contains(post.id),
        )
        .toList();
    return {
      EntryStatus.valid: validPosts,
      EntryStatus.invalid: invalidPosts,
      EntryStatus.pending: pendingPosts,
    };
  }

  Future<void> approveEntry(
    InstagramPost post,
    Challenge challenge,
  ) async {
    try {
      final newMap =
          Map<EntryStatus, List<InstagramPost>>.from(state.requireValue);
      newMap[EntryStatus.valid] = [...newMap[EntryStatus.valid]!, post];
      state = AsyncData(newMap);
      final newChallenge = challenge.copyWith(
        validEntryIds: List.from(challenge.validEntryIds)..add(post.id),
      );
      // TODO: Save challenge to database
    } catch (e, st) {
      state = AsyncError(e, st);
      ref.invalidateSelf();
    }
  }
}
