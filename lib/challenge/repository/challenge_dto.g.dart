// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeDtoImpl _$$ChallengeDtoImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeDtoImpl(
      $id: json[r'$id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      hashtags:
          (json['hashtags'] as List<dynamic>).map((e) => e as String).toList(),
      accounts:
          (json['accounts'] as List<dynamic>).map((e) => e as String).toList(),
      accountMentionRequired: json['accountMentionRequired'] as bool,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      validEntryIds: (json['validEntryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      invalidEntryIds: (json['invalidEntryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      prizes: json['prizes'] == null
          ? const []
          : ChallengeDto.prizesFromJson(json['prizes'] as List),
      winners: ChallengeDto.winnersFromJson(json['winners']),
      postId: json['postId'] as String?,
    );

Map<String, dynamic> _$$ChallengeDtoImplToJson(_$ChallengeDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'hashtags': instance.hashtags,
      'accounts': instance.accounts,
      'accountMentionRequired': instance.accountMentionRequired,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'validEntryIds': instance.validEntryIds,
      'invalidEntryIds': instance.invalidEntryIds,
      'prizes': ChallengeDto.prizesToJson(instance.prizes),
      'winners': ChallengeDto.winnersToJson(instance.winners),
      'postId': instance.postId,
    };
