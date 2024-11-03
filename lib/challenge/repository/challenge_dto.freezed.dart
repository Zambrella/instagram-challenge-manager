// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeDto _$ChallengeDtoFromJson(Map<String, dynamic> json) {
  return _ChallengeDto.fromJson(json);
}

/// @nodoc
mixin _$ChallengeDto {
// ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  String get $id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;
  bool get hashtagsRequired => throw _privateConstructorUsedError;
  List<String> get accounts => throw _privateConstructorUsedError;
  bool get accountMentionRequired => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  List<String> get validEntryIds => throw _privateConstructorUsedError;
  List<String> get invalidEntryIds => throw _privateConstructorUsedError;
  String? get postId => throw _privateConstructorUsedError;

  /// Serializes this ChallengeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeDtoCopyWith<ChallengeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeDtoCopyWith<$Res> {
  factory $ChallengeDtoCopyWith(
          ChallengeDto value, $Res Function(ChallengeDto) then) =
      _$ChallengeDtoCopyWithImpl<$Res, ChallengeDto>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String $id,
      String title,
      String description,
      List<String> hashtags,
      bool hashtagsRequired,
      List<String> accounts,
      bool accountMentionRequired,
      DateTime startDate,
      DateTime endDate,
      List<String> validEntryIds,
      List<String> invalidEntryIds,
      String? postId});
}

/// @nodoc
class _$ChallengeDtoCopyWithImpl<$Res, $Val extends ChallengeDto>
    implements $ChallengeDtoCopyWith<$Res> {
  _$ChallengeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? $id = null,
    Object? title = null,
    Object? description = null,
    Object? hashtags = null,
    Object? hashtagsRequired = null,
    Object? accounts = null,
    Object? accountMentionRequired = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? validEntryIds = null,
    Object? invalidEntryIds = null,
    Object? postId = freezed,
  }) {
    return _then(_value.copyWith(
      $id: null == $id
          ? _value.$id
          : $id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      hashtags: null == hashtags
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hashtagsRequired: null == hashtagsRequired
          ? _value.hashtagsRequired
          : hashtagsRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      accounts: null == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accountMentionRequired: null == accountMentionRequired
          ? _value.accountMentionRequired
          : accountMentionRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validEntryIds: null == validEntryIds
          ? _value.validEntryIds
          : validEntryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      invalidEntryIds: null == invalidEntryIds
          ? _value.invalidEntryIds
          : invalidEntryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeDtoImplCopyWith<$Res>
    implements $ChallengeDtoCopyWith<$Res> {
  factory _$$ChallengeDtoImplCopyWith(
          _$ChallengeDtoImpl value, $Res Function(_$ChallengeDtoImpl) then) =
      __$$ChallengeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String $id,
      String title,
      String description,
      List<String> hashtags,
      bool hashtagsRequired,
      List<String> accounts,
      bool accountMentionRequired,
      DateTime startDate,
      DateTime endDate,
      List<String> validEntryIds,
      List<String> invalidEntryIds,
      String? postId});
}

/// @nodoc
class __$$ChallengeDtoImplCopyWithImpl<$Res>
    extends _$ChallengeDtoCopyWithImpl<$Res, _$ChallengeDtoImpl>
    implements _$$ChallengeDtoImplCopyWith<$Res> {
  __$$ChallengeDtoImplCopyWithImpl(
      _$ChallengeDtoImpl _value, $Res Function(_$ChallengeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? $id = null,
    Object? title = null,
    Object? description = null,
    Object? hashtags = null,
    Object? hashtagsRequired = null,
    Object? accounts = null,
    Object? accountMentionRequired = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? validEntryIds = null,
    Object? invalidEntryIds = null,
    Object? postId = freezed,
  }) {
    return _then(_$ChallengeDtoImpl(
      $id: null == $id
          ? _value.$id
          : $id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      hashtags: null == hashtags
          ? _value._hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hashtagsRequired: null == hashtagsRequired
          ? _value.hashtagsRequired
          : hashtagsRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      accounts: null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accountMentionRequired: null == accountMentionRequired
          ? _value.accountMentionRequired
          : accountMentionRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validEntryIds: null == validEntryIds
          ? _value._validEntryIds
          : validEntryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      invalidEntryIds: null == invalidEntryIds
          ? _value._invalidEntryIds
          : invalidEntryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeDtoImpl extends _ChallengeDto {
  const _$ChallengeDtoImpl(
      {@JsonKey(includeToJson: false) required this.$id,
      required this.title,
      required this.description,
      required final List<String> hashtags,
      required this.hashtagsRequired,
      required final List<String> accounts,
      required this.accountMentionRequired,
      required this.startDate,
      required this.endDate,
      required final List<String> validEntryIds,
      required final List<String> invalidEntryIds,
      this.postId})
      : _hashtags = hashtags,
        _accounts = accounts,
        _validEntryIds = validEntryIds,
        _invalidEntryIds = invalidEntryIds,
        super._();

  factory _$ChallengeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeDtoImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  final String $id;
  @override
  final String title;
  @override
  final String description;
  final List<String> _hashtags;
  @override
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  @override
  final bool hashtagsRequired;
  final List<String> _accounts;
  @override
  List<String> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  final bool accountMentionRequired;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final List<String> _validEntryIds;
  @override
  List<String> get validEntryIds {
    if (_validEntryIds is EqualUnmodifiableListView) return _validEntryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validEntryIds);
  }

  final List<String> _invalidEntryIds;
  @override
  List<String> get invalidEntryIds {
    if (_invalidEntryIds is EqualUnmodifiableListView) return _invalidEntryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invalidEntryIds);
  }

  @override
  final String? postId;

  @override
  String toString() {
    return 'ChallengeDto(\$id: ${$id}, title: $title, description: $description, hashtags: $hashtags, hashtagsRequired: $hashtagsRequired, accounts: $accounts, accountMentionRequired: $accountMentionRequired, startDate: $startDate, endDate: $endDate, validEntryIds: $validEntryIds, invalidEntryIds: $invalidEntryIds, postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeDtoImpl &&
            (identical(other.$id, $id) || other.$id == $id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags) &&
            (identical(other.hashtagsRequired, hashtagsRequired) ||
                other.hashtagsRequired == hashtagsRequired) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.accountMentionRequired, accountMentionRequired) ||
                other.accountMentionRequired == accountMentionRequired) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._validEntryIds, _validEntryIds) &&
            const DeepCollectionEquality()
                .equals(other._invalidEntryIds, _invalidEntryIds) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      $id,
      title,
      description,
      const DeepCollectionEquality().hash(_hashtags),
      hashtagsRequired,
      const DeepCollectionEquality().hash(_accounts),
      accountMentionRequired,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_validEntryIds),
      const DeepCollectionEquality().hash(_invalidEntryIds),
      postId);

  /// Create a copy of ChallengeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeDtoImplCopyWith<_$ChallengeDtoImpl> get copyWith =>
      __$$ChallengeDtoImplCopyWithImpl<_$ChallengeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeDtoImplToJson(
      this,
    );
  }
}

abstract class _ChallengeDto extends ChallengeDto {
  const factory _ChallengeDto(
      {@JsonKey(includeToJson: false) required final String $id,
      required final String title,
      required final String description,
      required final List<String> hashtags,
      required final bool hashtagsRequired,
      required final List<String> accounts,
      required final bool accountMentionRequired,
      required final DateTime startDate,
      required final DateTime endDate,
      required final List<String> validEntryIds,
      required final List<String> invalidEntryIds,
      final String? postId}) = _$ChallengeDtoImpl;
  const _ChallengeDto._() : super._();

  factory _ChallengeDto.fromJson(Map<String, dynamic> json) =
      _$ChallengeDtoImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  String get $id;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get hashtags;
  @override
  bool get hashtagsRequired;
  @override
  List<String> get accounts;
  @override
  bool get accountMentionRequired;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  List<String> get validEntryIds;
  @override
  List<String> get invalidEntryIds;
  @override
  String? get postId;

  /// Create a copy of ChallengeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeDtoImplCopyWith<_$ChallengeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
