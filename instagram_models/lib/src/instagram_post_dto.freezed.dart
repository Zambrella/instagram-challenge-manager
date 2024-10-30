// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instagram_post_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InstagramPostDto _$InstagramPostDtoFromJson(Map<String, dynamic> json) {
  return _InstagramPostDto.fromJson(json);
}

/// @nodoc
mixin _$InstagramPostDto {
  String get id => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String get permalink => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this InstagramPostDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstagramPostDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstagramPostDtoCopyWith<InstagramPostDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstagramPostDtoCopyWith<$Res> {
  factory $InstagramPostDtoCopyWith(
          InstagramPostDto value, $Res Function(InstagramPostDto) then) =
      _$InstagramPostDtoCopyWithImpl<$Res, InstagramPostDto>;
  @useResult
  $Res call(
      {String id,
      String caption,
      String mediaType,
      String mediaUrl,
      String permalink,
      DateTime timestamp});
}

/// @nodoc
class _$InstagramPostDtoCopyWithImpl<$Res, $Val extends InstagramPostDto>
    implements $InstagramPostDtoCopyWith<$Res> {
  _$InstagramPostDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstagramPostDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? mediaType = null,
    Object? mediaUrl = null,
    Object? permalink = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: null == permalink
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InstagramPostDtoImplCopyWith<$Res>
    implements $InstagramPostDtoCopyWith<$Res> {
  factory _$$InstagramPostDtoImplCopyWith(_$InstagramPostDtoImpl value,
          $Res Function(_$InstagramPostDtoImpl) then) =
      __$$InstagramPostDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String caption,
      String mediaType,
      String mediaUrl,
      String permalink,
      DateTime timestamp});
}

/// @nodoc
class __$$InstagramPostDtoImplCopyWithImpl<$Res>
    extends _$InstagramPostDtoCopyWithImpl<$Res, _$InstagramPostDtoImpl>
    implements _$$InstagramPostDtoImplCopyWith<$Res> {
  __$$InstagramPostDtoImplCopyWithImpl(_$InstagramPostDtoImpl _value,
      $Res Function(_$InstagramPostDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of InstagramPostDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caption = null,
    Object? mediaType = null,
    Object? mediaUrl = null,
    Object? permalink = null,
    Object? timestamp = null,
  }) {
    return _then(_$InstagramPostDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: null == permalink
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$InstagramPostDtoImpl extends _InstagramPostDto {
  const _$InstagramPostDtoImpl(
      {required this.id,
      required this.caption,
      required this.mediaType,
      required this.mediaUrl,
      required this.permalink,
      required this.timestamp})
      : super._();

  factory _$InstagramPostDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstagramPostDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String caption;
  @override
  final String mediaType;
  @override
  final String mediaUrl;
  @override
  final String permalink;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'InstagramPostDto(id: $id, caption: $caption, mediaType: $mediaType, mediaUrl: $mediaUrl, permalink: $permalink, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstagramPostDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.permalink, permalink) ||
                other.permalink == permalink) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, caption, mediaType, mediaUrl, permalink, timestamp);

  /// Create a copy of InstagramPostDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstagramPostDtoImplCopyWith<_$InstagramPostDtoImpl> get copyWith =>
      __$$InstagramPostDtoImplCopyWithImpl<_$InstagramPostDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstagramPostDtoImplToJson(
      this,
    );
  }
}

abstract class _InstagramPostDto extends InstagramPostDto {
  const factory _InstagramPostDto(
      {required final String id,
      required final String caption,
      required final String mediaType,
      required final String mediaUrl,
      required final String permalink,
      required final DateTime timestamp}) = _$InstagramPostDtoImpl;
  const _InstagramPostDto._() : super._();

  factory _InstagramPostDto.fromJson(Map<String, dynamic> json) =
      _$InstagramPostDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get caption;
  @override
  String get mediaType;
  @override
  String get mediaUrl;
  @override
  String get permalink;
  @override
  DateTime get timestamp;

  /// Create a copy of InstagramPostDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstagramPostDtoImplCopyWith<_$InstagramPostDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
