import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_challenge_manager/instagram/domain/media_type.dart';

@immutable
class InstagramPost extends Equatable {
  const InstagramPost({
    required this.id,
    required this.caption,
    required this.mediaType,
    required this.mediaUrl,
    required this.permalink,
    required this.timestamp,
  });

  /// The unique identifier for the post.
  final String id;

  /// The caption of the post.
  final String caption;

  /// The type of media in the post.
  final MediaType mediaType;

  /// The URL to the media.
  /// Can be null if the media is copyrighted.
  final Uri? mediaUrl;

  /// The URL to the post on Instagram.
  final Uri permalink;

  /// When the post was created.
  final DateTime timestamp;

  @override
  List<Object?> get props => [
        id,
        caption,
        mediaType,
        mediaUrl,
        permalink,
        timestamp,
      ];

  List<String> get hashtags {
    return caption.split(' ').where((word) => word.startsWith('#')).toList();
  }
}
