// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prize_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrizeDto _$PrizeDtoFromJson(Map<String, dynamic> json) {
  return _PrizeDto.fromJson(json);
}

/// @nodoc
mixin _$PrizeDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String? get sponsor => throw _privateConstructorUsedError;

  /// Serializes this PrizeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrizeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrizeDtoCopyWith<PrizeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrizeDtoCopyWith<$Res> {
  factory $PrizeDtoCopyWith(PrizeDto value, $Res Function(PrizeDto) then) =
      _$PrizeDtoCopyWithImpl<$Res, PrizeDto>;
  @useResult
  $Res call({String id, String name, double quantity, String? sponsor});
}

/// @nodoc
class _$PrizeDtoCopyWithImpl<$Res, $Val extends PrizeDto>
    implements $PrizeDtoCopyWith<$Res> {
  _$PrizeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrizeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? sponsor = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      sponsor: freezed == sponsor
          ? _value.sponsor
          : sponsor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrizeDtoImplCopyWith<$Res>
    implements $PrizeDtoCopyWith<$Res> {
  factory _$$PrizeDtoImplCopyWith(
          _$PrizeDtoImpl value, $Res Function(_$PrizeDtoImpl) then) =
      __$$PrizeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double quantity, String? sponsor});
}

/// @nodoc
class __$$PrizeDtoImplCopyWithImpl<$Res>
    extends _$PrizeDtoCopyWithImpl<$Res, _$PrizeDtoImpl>
    implements _$$PrizeDtoImplCopyWith<$Res> {
  __$$PrizeDtoImplCopyWithImpl(
      _$PrizeDtoImpl _value, $Res Function(_$PrizeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrizeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? quantity = null,
    Object? sponsor = freezed,
  }) {
    return _then(_$PrizeDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      sponsor: freezed == sponsor
          ? _value.sponsor
          : sponsor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PrizeDtoImpl extends _PrizeDto {
  const _$PrizeDtoImpl(
      {required this.id,
      required this.name,
      required this.quantity,
      this.sponsor})
      : super._();

  factory _$PrizeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrizeDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double quantity;
  @override
  final String? sponsor;

  @override
  String toString() {
    return 'PrizeDto(id: $id, name: $name, quantity: $quantity, sponsor: $sponsor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrizeDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.sponsor, sponsor) || other.sponsor == sponsor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, quantity, sponsor);

  /// Create a copy of PrizeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrizeDtoImplCopyWith<_$PrizeDtoImpl> get copyWith =>
      __$$PrizeDtoImplCopyWithImpl<_$PrizeDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrizeDtoImplToJson(
      this,
    );
  }
}

abstract class _PrizeDto extends PrizeDto {
  const factory _PrizeDto(
      {required final String id,
      required final String name,
      required final double quantity,
      final String? sponsor}) = _$PrizeDtoImpl;
  const _PrizeDto._() : super._();

  factory _PrizeDto.fromJson(Map<String, dynamic> json) =
      _$PrizeDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get quantity;
  @override
  String? get sponsor;

  /// Create a copy of PrizeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrizeDtoImplCopyWith<_$PrizeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
