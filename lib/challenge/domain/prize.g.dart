// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prize.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PrizeCWProxy {
  Prize id(String id);

  Prize name(String name);

  Prize quantity(double quantity);

  Prize sponsor(String? sponsor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Prize(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Prize(...).copyWith(id: 12, name: "My name")
  /// ````
  Prize call({
    String? id,
    String? name,
    double? quantity,
    String? sponsor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPrize.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPrize.copyWith.fieldName(...)`
class _$PrizeCWProxyImpl implements _$PrizeCWProxy {
  const _$PrizeCWProxyImpl(this._value);

  final Prize _value;

  @override
  Prize id(String id) => this(id: id);

  @override
  Prize name(String name) => this(name: name);

  @override
  Prize quantity(double quantity) => this(quantity: quantity);

  @override
  Prize sponsor(String? sponsor) => this(sponsor: sponsor);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Prize(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Prize(...).copyWith(id: 12, name: "My name")
  /// ````
  Prize call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? sponsor = const $CopyWithPlaceholder(),
  }) {
    return Prize(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      quantity: quantity == const $CopyWithPlaceholder() || quantity == null
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as double,
      sponsor: sponsor == const $CopyWithPlaceholder()
          ? _value.sponsor
          // ignore: cast_nullable_to_non_nullable
          : sponsor as String?,
    );
  }
}

extension $PrizeCopyWith on Prize {
  /// Returns a callable class that can be used as follows: `instanceOfPrize.copyWith(...)` or like so:`instanceOfPrize.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PrizeCWProxy get copyWith => _$PrizeCWProxyImpl(this);
}
