import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_core/src/subscription_length.dart';

part 'subscription_package.freezed.dart';

/// {@template subscription_package}
/// Representation of a subscription available to the user.
/// {@endtemplate}
@freezed
class SubscriptionPackage with _$SubscriptionPackage {
  /// {@macro subscription_package}
  const factory SubscriptionPackage({
    /// The duration of the subscription.
    required SubscriptionLength duration,

    /// The type of subscription. E.g. 'Premium', 'Plus'.
    required String subscriptionType,

    /// The identifier used on the backend to identify the subscription.
    required String identifier,

    /// The name of the subscription. Visible to users.
    required String name,

    /// The price of the subscription.
    required double price,

    /// The discounted price of the subscription, if available.
    required double? discountedPrice,

    /// The currency code of the subscription price.
    required String currencyCode,
  }) = _SubscriptionPackage;

  const SubscriptionPackage._();

  /// Returns the discount percentage, as a `String`, of the subscription
  /// package.
  /// Returns `null` if the package is not discounted.
  String? discountPercentage() {
    if (discountedPrice == null) {
      return null;
    } else {
      final discount = (1 - (discountedPrice! / price)) * 100;
      return '${discount.toStringAsFixed(0)}%';
    }
  }
}
