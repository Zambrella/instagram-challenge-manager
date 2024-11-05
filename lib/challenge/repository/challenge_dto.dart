import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_challenge_manager/challenge/domain/account.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/hashtag.dart';
import 'package:instagram_challenge_manager/challenge/repository/prize_dto.dart';

part 'challenge_dto.freezed.dart';
part 'challenge_dto.g.dart';

@freezed
class ChallengeDto with _$ChallengeDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory ChallengeDto({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String $id,
    required String title,
    required String description,
    required List<String> hashtags,
    required List<String> accounts,
    required bool accountMentionRequired,
    required DateTime startDate,
    required DateTime endDate,
    required List<String> validEntryIds,
    required List<String> invalidEntryIds,
    // ignore: invalid_annotation_target
    @JsonKey(
      toJson: ChallengeDto.prizesToJson,
      fromJson: ChallengeDto.prizesFromJson,
    )
    @Default([])
    List<PrizeDto> prizes,
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
      accounts: challenge.accounts.map((e) => e.value).toList(),
      accountMentionRequired: challenge.accountMentionRequired,
      startDate: challenge.startDate,
      endDate: challenge.endDate,
      validEntryIds: challenge.validEntryIds,
      invalidEntryIds: challenge.invalidEntryIds,
      postId: challenge.postId,
      prizes: challenge.prizes.map(PrizeDto.fromDomain).toList(),
    );
  }

  static Object prizesToJson(List<PrizeDto> prizes) {
    final prizesEncoded = prizes.map((e) => jsonEncode(e.toJson())).toList();
    return prizesEncoded;
  }

  static List<PrizeDto> prizesFromJson(List<dynamic> prizes) {
    final prizesDecoded = prizes
        .map(
          (e) => PrizeDto.fromJson(
            jsonDecode(e as String) as Map<String, dynamic>,
          ),
        )
        .toList();
    return prizesDecoded;
  }

  Challenge toDomain() {
    return Challenge(
      id: $id,
      title: title,
      description: description,
      hashtags: hashtags.map(Hashtag.new).toList(),
      accounts: accounts.map(Account.new).toList(),
      accountMentionRequired: accountMentionRequired,
      startDate: startDate,
      endDate: endDate,
      validEntryIds: validEntryIds,
      invalidEntryIds: invalidEntryIds,
      postId: postId,
      prizes: prizes.map((e) => e.toDomain()).toList(),
    );
  }
}
