// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionPackage {
  /// The duration of the subscription.
  SubscriptionLength get duration => throw _privateConstructorUsedError;

  /// The type of subscription. E.g. 'Premium', 'Plus'.
  String get subscriptionType => throw _privateConstructorUsedError;

  /// The identifier used on the backend to identify the subscription.
  String get identifier => throw _privateConstructorUsedError;

  /// The name of the subscription. Visible to users.
  String get name => throw _privateConstructorUsedError;

  /// The price of the subscription.
  double get price => throw _privateConstructorUsedError;

  /// The discounted price of the subscription, if available.
  double? get discountedPrice => throw _privateConstructorUsedError;

  /// The currency code of the subscription price.
  String get currencyCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionPackageCopyWith<SubscriptionPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPackageCopyWith<$Res> {
  factory $SubscriptionPackageCopyWith(
          SubscriptionPackage value, $Res Function(SubscriptionPackage) then) =
      _$SubscriptionPackageCopyWithImpl<$Res, SubscriptionPackage>;
  @useResult
  $Res call(
      {SubscriptionLength duration,
      String subscriptionType,
      String identifier,
      String name,
      double price,
      double? discountedPrice,
      String currencyCode});
}

/// @nodoc
class _$SubscriptionPackageCopyWithImpl<$Res, $Val extends SubscriptionPackage>
    implements $SubscriptionPackageCopyWith<$Res> {
  _$SubscriptionPackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? subscriptionType = null,
    Object? identifier = null,
    Object? name = null,
    Object? price = null,
    Object? discountedPrice = freezed,
    Object? currencyCode = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as SubscriptionLength,
      subscriptionType: null == subscriptionType
          ? _value.subscriptionType
          : subscriptionType // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionPackageImplCopyWith<$Res>
    implements $SubscriptionPackageCopyWith<$Res> {
  factory _$$SubscriptionPackageImplCopyWith(_$SubscriptionPackageImpl value,
          $Res Function(_$SubscriptionPackageImpl) then) =
      __$$SubscriptionPackageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SubscriptionLength duration,
      String subscriptionType,
      String identifier,
      String name,
      double price,
      double? discountedPrice,
      String currencyCode});
}

/// @nodoc
class __$$SubscriptionPackageImplCopyWithImpl<$Res>
    extends _$SubscriptionPackageCopyWithImpl<$Res, _$SubscriptionPackageImpl>
    implements _$$SubscriptionPackageImplCopyWith<$Res> {
  __$$SubscriptionPackageImplCopyWithImpl(_$SubscriptionPackageImpl _value,
      $Res Function(_$SubscriptionPackageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? subscriptionType = null,
    Object? identifier = null,
    Object? name = null,
    Object? price = null,
    Object? discountedPrice = freezed,
    Object? currencyCode = null,
  }) {
    return _then(_$SubscriptionPackageImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as SubscriptionLength,
      subscriptionType: null == subscriptionType
          ? _value.subscriptionType
          : subscriptionType // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubscriptionPackageImpl extends _SubscriptionPackage {
  const _$SubscriptionPackageImpl(
      {required this.duration,
      required this.subscriptionType,
      required this.identifier,
      required this.name,
      required this.price,
      required this.discountedPrice,
      required this.currencyCode})
      : super._();

  /// The duration of the subscription.
  @override
  final SubscriptionLength duration;

  /// The type of subscription. E.g. 'Premium', 'Plus'.
  @override
  final String subscriptionType;

  /// The identifier used on the backend to identify the subscription.
  @override
  final String identifier;

  /// The name of the subscription. Visible to users.
  @override
  final String name;

  /// The price of the subscription.
  @override
  final double price;

  /// The discounted price of the subscription, if available.
  @override
  final double? discountedPrice;

  /// The currency code of the subscription price.
  @override
  final String currencyCode;

  @override
  String toString() {
    return 'SubscriptionPackage(duration: $duration, subscriptionType: $subscriptionType, identifier: $identifier, name: $name, price: $price, discountedPrice: $discountedPrice, currencyCode: $currencyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPackageImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.subscriptionType, subscriptionType) ||
                other.subscriptionType == subscriptionType) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, subscriptionType,
      identifier, name, price, discountedPrice, currencyCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionPackageImplCopyWith<_$SubscriptionPackageImpl> get copyWith =>
      __$$SubscriptionPackageImplCopyWithImpl<_$SubscriptionPackageImpl>(
          this, _$identity);
}

abstract class _SubscriptionPackage extends SubscriptionPackage {
  const factory _SubscriptionPackage(
      {required final SubscriptionLength duration,
      required final String subscriptionType,
      required final String identifier,
      required final String name,
      required final double price,
      required final double? discountedPrice,
      required final String currencyCode}) = _$SubscriptionPackageImpl;
  const _SubscriptionPackage._() : super._();

  @override

  /// The duration of the subscription.
  SubscriptionLength get duration;
  @override

  /// The type of subscription. E.g. 'Premium', 'Plus'.
  String get subscriptionType;
  @override

  /// The identifier used on the backend to identify the subscription.
  String get identifier;
  @override

  /// The name of the subscription. Visible to users.
  String get name;
  @override

  /// The price of the subscription.
  double get price;
  @override

  /// The discounted price of the subscription, if available.
  double? get discountedPrice;
  @override

  /// The currency code of the subscription price.
  String get currencyCode;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionPackageImplCopyWith<_$SubscriptionPackageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
