import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/entry_status.dart';
import 'package:instagram_challenge_manager/challenge/providers/challenge_service_provider.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_entries_controller.g.dart';

@riverpod
class ChallengeEntriesController extends _$ChallengeEntriesController {
  @override
  Future<(Challenge challenge, ChallengeEntries challengeEntries)> build(
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
    return (
      challenge,
      {
        EntryStatus.valid: validPosts,
        EntryStatus.invalid: invalidPosts,
        EntryStatus.pending: pendingPosts,
      }
    );
  }

  Future<void> approveEntry(
    InstagramPost post,
  ) async {
    try {
      final newEntries =
          state.requireValue.$2.addOrUpdateEntry(post, EntryStatus.valid);
      final newChallenge = state.requireValue.$1.addValidEntry(post.id);
      state = AsyncData((newChallenge, newEntries));
      await ref.read(challengeServiceProvider).updateChallenge(newChallenge);
    } catch (e, st) {
      state = AsyncError(e, st);
      ref.invalidateSelf();
    }
  }

  Future<void> rejectEntry(
    InstagramPost post,
  ) async {
    try {
      final newEntries =
          state.requireValue.$2.addOrUpdateEntry(post, EntryStatus.invalid);
      final newChallenge = state.requireValue.$1.addInvalidEntry(post.id);
      state = AsyncData((newChallenge, newEntries));
      await ref.read(challengeServiceProvider).updateChallenge(newChallenge);
    } catch (e, st) {
      state = AsyncError(e, st);
      ref.invalidateSelf();
    }
  }
}

typedef ChallengeEntries = Map<EntryStatus, List<InstagramPost>>;

extension ChallengeEntriesX on Map<EntryStatus, List<InstagramPost>> {
  List<InstagramPost> get valid => this[EntryStatus.valid]!;
  List<InstagramPost> get invalid => this[EntryStatus.invalid]!;
  List<InstagramPost> get pending => this[EntryStatus.pending]!;

  /// Adds a post to the entries.
  ChallengeEntries addEntry(InstagramPost post, EntryStatus status) {
    return {
      ...this,
      status: [...this[status]!, post],
    };
  }

  /// Removes a post from the entries.
  /// Will then add the post to the pending entries.
  /// Should not be used to remove a post from pending entries.
  ChallengeEntries removeEntry(InstagramPost post, EntryStatus status) {
    assert(
      status != EntryStatus.pending,
      'Cannot remove post from pending entries',
    );
    return {
      ...this,
      EntryStatus.pending: [...this[EntryStatus.pending]!, post],
      status: this[status]!.where((element) => element != post).toList(),
    };
  }

  /// Adds or updates a post in the entries.
  /// Will remove remove the post from all other statuses.
  ChallengeEntries addOrUpdateEntry(InstagramPost post, EntryStatus newStatus) {
    // Start with the current entries
    final updatedEntries = Map<EntryStatus, List<InstagramPost>>.from(this);

    // Iterate over all statuses to remove the post if it exists
    for (final status in EntryStatus.values) {
      updatedEntries[status] = updatedEntries[status]!
          .where((existingPost) => existingPost != post)
          .toList();
    }

    // Add the post to the new status
    updatedEntries[newStatus] = [...updatedEntries[newStatus]!, post];

    return updatedEntries;
  }
}
