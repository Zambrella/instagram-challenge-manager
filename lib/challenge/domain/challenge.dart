import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_challenge_manager/challenge/domain/account.dart';
import 'package:instagram_challenge_manager/challenge/domain/hashtag.dart';
import 'package:instagram_challenge_manager/challenge/domain/prize.dart';

part 'challenge.g.dart';

@CopyWith()
class Challenge extends Equatable {
  const Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.hashtags,
    required this.hashtagsRequired,
    required this.accounts,
    required this.accountMentionRequired,
    required this.startDate,
    required this.endDate,
    this.prizes,
    this.validEntryIds = const [],
    this.invalidEntryIds = const [],
    this.winners = const {},
  });

  /// The id of the challenge.
  final String id;

  /// The title of the challenge.
  final String title;

  /// The description of the challenge.
  final String description;

  /// The hashtags associated with the challenge.
  final List<Hashtag> hashtags;

  /// Whether the hashtags are required to be entered.
  final bool hashtagsRequired;

  /// The instagram accounts of the owners of the challenge.
  final List<Account> accounts;

  /// Whether the accounts are required to be mentioned.
  final bool accountMentionRequired;

  /// The start date of the challenge.
  final DateTime startDate;

  /// The end date of the challenge.
  final DateTime endDate;

  /// The prizes for the challenge.
  /// `null` means there are no prizes.
  final List<Prize>? prizes;

  /// A list of valid entry ids.
  /// The ids are the relevant ids of the instagram post.
  final List<String> validEntryIds;

  /// A list of invalid entry ids.
  /// The ids are the relevant ids of the instagram post.
  final List<String> invalidEntryIds;

  /// The winners of the challenge.
  /// The key is the account id and value is the prize id.
  /// Prize id can be `null` if the winner did not win a prize.
  final Map<String, String?> winners;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        hashtags,
        hashtagsRequired,
        accounts,
        accountMentionRequired,
        startDate,
        endDate,
        prizes,
        validEntryIds,
        invalidEntryIds,
        winners,
      ];
}
