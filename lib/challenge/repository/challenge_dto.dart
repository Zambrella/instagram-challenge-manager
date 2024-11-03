import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_challenge_manager/challenge/domain/account.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/hashtag.dart';

part 'challenge_dto.freezed.dart';
part 'challenge_dto.g.dart';

@freezed
class ChallengeDto with _$ChallengeDto {
  const factory ChallengeDto({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String $id,
    required String title,
    required String description,
    required List<String> hashtags,
    required bool hashtagsRequired,
    required List<String> accounts,
    required bool accountMentionRequired,
    required DateTime startDate,
    required DateTime endDate,
    required List<String> validEntryIds,
    required List<String> invalidEntryIds,
    String? postId,
  }) = _ChallengeDto;

  const ChallengeDto._();

  factory ChallengeDto.fromJson(Map<String, dynamic> json) =>
      _$ChallengeDtoFromJson(json);

  factory ChallengeDto.fromDomain(Challenge challenge) {
    return ChallengeDto(
      $id: challenge.id,
      title: challenge.title,
      description: challenge.description,
      hashtags: challenge.hashtags.map((e) => e.value).toList(),
      hashtagsRequired: challenge.hashtagsRequired,
      accounts: challenge.accounts.map((e) => e.value).toList(),
      accountMentionRequired: challenge.accountMentionRequired,
      startDate: challenge.startDate,
      endDate: challenge.endDate,
      validEntryIds: challenge.validEntryIds,
      invalidEntryIds: challenge.invalidEntryIds,
      postId: challenge.postId,
    );
  }

  Challenge toDomain() {
    return Challenge(
      id: $id,
      title: title,
      description: description,
      hashtags: hashtags.map(Hashtag.new).toList(),
      hashtagsRequired: hashtagsRequired,
      accounts: accounts.map(Account.new).toList(),
      accountMentionRequired: accountMentionRequired,
      startDate: startDate,
      endDate: endDate,
      validEntryIds: validEntryIds,
      invalidEntryIds: invalidEntryIds,
      postId: postId,
    );
  }
}
