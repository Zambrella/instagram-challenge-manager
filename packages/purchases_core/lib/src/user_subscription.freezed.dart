// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserSubscription {
  /// Whether the user is subscribed.
  bool get isSubscribed => throw _privateConstructorUsedError;

  /// The date the subscription expires.
  DateTime? get expirationDate => throw _privateConstructorUsedError;

  /// The type of subscription. E.g. 'Premium', 'Plus'.
  String? get subscriptionType => throw _privateConstructorUsedError;

  /// Whether the subscription will automatically renew.
  bool? get willRenew => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)
        $default, {
    required TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        $default, {
    TResult? Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        $default, {
    TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserSubscription value) $default, {
    required TResult Function(_UserSubscriptionEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserSubscription value)? $default, {
    TResult? Function(_UserSubscriptionEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserSubscription value)? $default, {
    TResult Function(_UserSubscriptionEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSubscriptionCopyWith<UserSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSubscriptionCopyWith<$Res> {
  factory $UserSubscriptionCopyWith(
          UserSubscription value, $Res Function(UserSubscription) then) =
      _$UserSubscriptionCopyWithImpl<$Res, UserSubscription>;
  @useResult
  $Res call(
      {bool isSubscribed,
      DateTime? expirationDate,
      String? subscriptionType,
      bool? willRenew});
}

/// @nodoc
class _$UserSubscriptionCopyWithImpl<$Res, $Val extends UserSubscription>
    implements $UserSubscriptionCopyWith<$Res> {
  _$UserSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubscribed = null,
    Object? expirationDate = freezed,
    Object? subscriptionType = freezed,
    Object? willRenew = freezed,
  }) {
    return _then(_value.copyWith(
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subscriptionType: freezed == subscriptionType
          ? _value.subscriptionType
          : subscriptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      willRenew: freezed == willRenew
          ? _value.willRenew
          : willRenew // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSubscriptionImplCopyWith<$Res>
    implements $UserSubscriptionCopyWith<$Res> {
  factory _$$UserSubscriptionImplCopyWith(_$UserSubscriptionImpl value,
          $Res Function(_$UserSubscriptionImpl) then) =
      __$$UserSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubscribed,
      DateTime? expirationDate,
      String? subscriptionType,
      bool? willRenew});
}

/// @nodoc
class __$$UserSubscriptionImplCopyWithImpl<$Res>
    extends _$UserSubscriptionCopyWithImpl<$Res, _$UserSubscriptionImpl>
    implements _$$UserSubscriptionImplCopyWith<$Res> {
  __$$UserSubscriptionImplCopyWithImpl(_$UserSubscriptionImpl _value,
      $Res Function(_$UserSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubscribed = null,
    Object? expirationDate = freezed,
    Object? subscriptionType = freezed,
    Object? willRenew = freezed,
  }) {
    return _then(_$UserSubscriptionImpl(
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subscriptionType: freezed == subscriptionType
          ? _value.subscriptionType
          : subscriptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      willRenew: freezed == willRenew
          ? _value.willRenew
          : willRenew // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$UserSubscriptionImpl extends _UserSubscription {
  const _$UserSubscriptionImpl(
      {required this.isSubscribed,
      required this.expirationDate,
      required this.subscriptionType,
      required this.willRenew})
      : super._();

  /// Whether the user is subscribed.
  @override
  final bool isSubscribed;

  /// The date the subscription expires.
  @override
  final DateTime? expirationDate;

  /// The type of subscription. E.g. 'Premium', 'Plus'.
  @override
  final String? subscriptionType;

  /// Whether the subscription will automatically renew.
  @override
  final bool? willRenew;

  @override
  String toString() {
    return 'UserSubscription(isSubscribed: $isSubscribed, expirationDate: $expirationDate, subscriptionType: $subscriptionType, willRenew: $willRenew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSubscriptionImpl &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType) &&
            (identical(other.willRenew, willRenew) ||
                other.willRenew == willRenew));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isSubscribed, expirationDate, subscriptionType, willRenew);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSubscriptionImplCopyWith<_$UserSubscriptionImpl> get copyWith =>
      __$$UserSubscriptionImplCopyWithImpl<_$UserSubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)
        $default, {
    required TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)
        empty,
  }) {
    return $default(isSubscribed, expirationDate, subscriptionType, willRenew);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        $default, {
    TResult? Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        empty,
  }) {
    return $default?.call(
        isSubscribed, expirationDate, subscriptionType, willRenew);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        $default, {
    TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          isSubscribed, expirationDate, subscriptionType, willRenew);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserSubscription value) $default, {
    required TResult Function(_UserSubscriptionEmpty value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserSubscription value)? $default, {
    TResult? Function(_UserSubscriptionEmpty value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserSubscription value)? $default, {
    TResult Function(_UserSubscriptionEmpty value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _UserSubscription extends UserSubscription {
  const factory _UserSubscription(
      {required final bool isSubscribed,
      required final DateTime? expirationDate,
      required final String? subscriptionType,
      required final bool? willRenew}) = _$UserSubscriptionImpl;
  const _UserSubscription._() : super._();

  @override

  /// Whether the user is subscribed.
  bool get isSubscribed;
  @override

  /// The date the subscription expires.
  DateTime? get expirationDate;
  @override

  /// The type of subscription. E.g. 'Premium', 'Plus'.
  String? get subscriptionType;
  @override

  /// Whether the subscription will automatically renew.
  bool? get willRenew;
  @override
  @JsonKey(ignore: true)
  _$$UserSubscriptionImplCopyWith<_$UserSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserSubscriptionEmptyImplCopyWith<$Res>
    implements $UserSubscriptionCopyWith<$Res> {
  factory _$$UserSubscriptionEmptyImplCopyWith(
          _$UserSubscriptionEmptyImpl value,
          $Res Function(_$UserSubscriptionEmptyImpl) then) =
      __$$UserSubscriptionEmptyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubscribed,
      DateTime? expirationDate,
      String? subscriptionType,
      bool? willRenew});
}

/// @nodoc
class __$$UserSubscriptionEmptyImplCopyWithImpl<$Res>
    extends _$UserSubscriptionCopyWithImpl<$Res, _$UserSubscriptionEmptyImpl>
    implements _$$UserSubscriptionEmptyImplCopyWith<$Res> {
  __$$UserSubscriptionEmptyImplCopyWithImpl(_$UserSubscriptionEmptyImpl _value,
      $Res Function(_$UserSubscriptionEmptyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubscribed = null,
    Object? expirationDate = freezed,
    Object? subscriptionType = freezed,
    Object? willRenew = freezed,
  }) {
    return _then(_$UserSubscriptionEmptyImpl(
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subscriptionType: freezed == subscriptionType
          ? _value.subscriptionType
          : subscriptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      willRenew: freezed == willRenew
          ? _value.willRenew
          : willRenew // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$UserSubscriptionEmptyImpl extends _UserSubscriptionEmpty {
  const _$UserSubscriptionEmptyImpl(
      {this.isSubscribed = false,
      this.expirationDate,
      this.subscriptionType,
      this.willRenew})
      : super._();

  /// Whether the user is subscribed.
  @override
  @JsonKey()
  final bool isSubscribed;

  /// The date the subscription expires.
  @override
  final DateTime? expirationDate;

  /// The type of subscription. E.g. 'Premium', 'Plus'.
  @override
  final String? subscriptionType;

  /// Whether the subscription will automatically renew.
  @override
  final bool? willRenew;

  @override
  String toString() {
    return 'UserSubscription.empty(isSubscribed: $isSubscribed, expirationDate: $expirationDate, subscriptionType: $subscriptionType, willRenew: $willRenew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSubscriptionEmptyImpl &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType) &&
            (identical(other.willRenew, willRenew) ||
                other.willRenew == willRenew));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isSubscribed, expirationDate, subscriptionType, willRenew);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSubscriptionEmptyImplCopyWith<_$UserSubscriptionEmptyImpl>
      get copyWith => __$$UserSubscriptionEmptyImplCopyWithImpl<
          _$UserSubscriptionEmptyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)
        $default, {
    required TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)
        empty,
  }) {
    return empty(isSubscribed, expirationDate, subscriptionType, willRenew);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        $default, {
    TResult? Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        empty,
  }) {
    return empty?.call(
        isSubscribed, expirationDate, subscriptionType, willRenew);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        $default, {
    TResult Function(bool isSubscribed, DateTime? expirationDate,
            String? subscriptionType, bool? willRenew)?
        empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(isSubscribed, expirationDate, subscriptionType, willRenew);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserSubscription value) $default, {
    required TResult Function(_UserSubscriptionEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserSubscription value)? $default, {
    TResult? Function(_UserSubscriptionEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserSubscription value)? $default, {
    TResult Function(_UserSubscriptionEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _UserSubscriptionEmpty extends UserSubscription {
  const factory _UserSubscriptionEmpty(
      {final bool isSubscribed,
      final DateTime? expirationDate,
      final String? subscriptionType,
      final bool? willRenew}) = _$UserSubscriptionEmptyImpl;
  const _UserSubscriptionEmpty._() : super._();

  @override

  /// Whether the user is subscribed.
  bool get isSubscribed;
  @override

  /// The date the subscription expires.
  DateTime? get expirationDate;
  @override

  /// The type of subscription. E.g. 'Premium', 'Plus'.
  String? get subscriptionType;
  @override

  /// Whether the subscription will automatically renew.
  bool? get willRenew;
  @override
  @JsonKey(ignore: true)
  _$$UserSubscriptionEmptyImplCopyWith<_$UserSubscriptionEmptyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
