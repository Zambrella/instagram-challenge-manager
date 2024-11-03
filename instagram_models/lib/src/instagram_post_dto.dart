import 'package:freezed_annotation/freezed_annotation.dart';

part 'instagram_post_dto.freezed.dart';
part 'instagram_post_dto.g.dart';

@freezed
class InstagramPostDto with _$InstagramPostDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory InstagramPostDto({
    required String id,
    required String username,
    required String caption,
    required String mediaType,
    required String mediaUrl,
    required String permalink,
    required DateTime timestamp,
    required int likeCount,
    required int commentsCount,
  }) = _InstagramPostDto;

  const InstagramPostDto._();

  factory InstagramPostDto.fromJson(Map<String, dynamic> json) =>
      _$InstagramPostDtoFromJson(json);
}
