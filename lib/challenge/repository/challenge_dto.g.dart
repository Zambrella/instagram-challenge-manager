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
      hashtagsRequired: json['hashtagsRequired'] as bool,
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
      postId: json['postId'] as String?,
    );

Map<String, dynamic> _$$ChallengeDtoImplToJson(_$ChallengeDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'hashtags': instance.hashtags,
      'hashtagsRequired': instance.hashtagsRequired,
      'accounts': instance.accounts,
      'accountMentionRequired': instance.accountMentionRequired,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'validEntryIds': instance.validEntryIds,
      'invalidEntryIds': instance.invalidEntryIds,
      'postId': instance.postId,
    };
