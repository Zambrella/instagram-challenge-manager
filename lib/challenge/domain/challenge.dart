import 'dart:math';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_challenge_manager/challenge/domain/account.dart';
import 'package:instagram_challenge_manager/challenge/domain/hashtag.dart';
import 'package:instagram_challenge_manager/challenge/domain/prize.dart';

part 'challenge.g.dart';

@CopyWith()
class Challenge extends Equatable {
  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.hashtags,
    required this.accounts,
    required this.accountMentionRequired,
    required this.startDate,
    required this.endDate,
    this.postId,
    this.prizes = const [],
    this.validEntryIds = const [],
    this.invalidEntryIds = const [],
    this.winners = const {},
  }) : assert(
          hashtags.isNotEmpty,
          'There must be at least one hashtag.',
        );

  /// The id of the challenge.
  final String id;

  /// The title of the challenge.
  final String title;

  /// The description of the challenge.
  final String description;

  /// The hashtags associated with the challenge.
  final List<Hashtag> hashtags;

  /// The instagram accounts of the owners of the challenge.
  final List<Account> accounts;

  /// Whether the accounts are required to be mentioned.
  final bool accountMentionRequired;

  /// The start date of the challenge.
  final DateTime startDate;

  /// The end date of the challenge.
  final DateTime endDate;

  /// The id of the Instagram post that started the challenge.
  final String? postId;

  /// The prizes for the challenge.
  /// `null` means there are no prizes.
  final List<Prize> prizes;

  /// A list of valid entry ids.
  /// The ids are the relevant ids of the instagram post.
  final List<String> validEntryIds;

  /// A list of invalid entry ids.
  /// The ids are the relevant ids of the instagram post.
  final List<String> invalidEntryIds;

  /// The winners of the challenge.
  /// The key is the entryId and the value is the prize id.
  final Map<String, String> winners;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        hashtags,
        accounts,
        accountMentionRequired,
        startDate,
        endDate,
        postId,
        prizes,
        validEntryIds,
        invalidEntryIds,
        winners,
      ];

  @override
  String toString() {
    return 'Challenge(id: $id, title: $title)';
  }

  /// Adds a valid entry to the challenge.
  /// Will remove the entry from invalid entries if it exists.
  Challenge addValidEntry(String id) {
    return copyWith(
      validEntryIds:
          validEntryIds.contains(id) ? validEntryIds : [...validEntryIds, id],
      invalidEntryIds: invalidEntryIds.contains(id)
          ? List<String>.from(invalidEntryIds.where((element) => element != id))
          : invalidEntryIds,
    );
  }

  /// Adds an invalid entry to the challenge.
  /// Will remove the entry from valid entries if it exists.
  Challenge addInvalidEntry(String id) {
    return copyWith(
      invalidEntryIds: invalidEntryIds.contains(id)
          ? invalidEntryIds
          : [...invalidEntryIds, id],
      validEntryIds: validEntryIds.contains(id)
          ? List<String>.from(validEntryIds.where((element) => element != id))
          : validEntryIds,
    );
  }

  Challenge drawWinners() {
    final winners = <String, String>{};

    final mutPrizes = List<Prize>.from(
      prizes.expand(
        (e) => List.generate(
          e.quantity,
          (_) => e.copyWith(quantity: 1),
        ),
      ),
    );
    final mutEntries = List<String>.from(validEntryIds);

    // Can't have more winners than the number of prizes or entries
    final numberOfWinners = min(mutPrizes.length, mutEntries.length);

    final random = Random();

    for (var i = 0; i < numberOfWinners; i++) {
      final winnerEntryIndex = random.nextInt(mutEntries.length);
      final prizeEntryIndex = random.nextInt(mutPrizes.length);
      final winner = mutEntries.removeAt(winnerEntryIndex);
      final prize = mutPrizes.removeAt(prizeEntryIndex);
      winners[winner] = prize.id;
    }

    return copyWith(winners: winners);
  }
}
