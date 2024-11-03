// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instagram_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstagramPostDtoImpl _$$InstagramPostDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$InstagramPostDtoImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      caption: json['caption'] as String,
      mediaType: json['media_type'] as String,
      mediaUrl: json['media_url'] as String,
      permalink: json['permalink'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      likeCount: (json['like_count'] as num).toInt(),
      commentsCount: (json['comments_count'] as num).toInt(),
    );

Map<String, dynamic> _$$InstagramPostDtoImplToJson(
        _$InstagramPostDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'caption': instance.caption,
      'media_type': instance.mediaType,
      'media_url': instance.mediaUrl,
      'permalink': instance.permalink,
      'timestamp': instance.timestamp.toIso8601String(),
      'like_count': instance.likeCount,
      'comments_count': instance.commentsCount,
    };
