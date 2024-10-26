import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_subscription.freezed.dart';

/// {@template user_subscription}
/// {@endtemplate}
@freezed
class UserSubscription with _$UserSubscription {
  /// {@macro user_subscription}
  const factory UserSubscription({
    /// Whether the user is subscribed.
    required bool isSubscribed,

    /// The date the subscription expires.
    required DateTime? expirationDate,

    /// The type of subscription. E.g. 'Premium', 'Plus'.
    required String? subscriptionType,

    /// Whether the subscription will automatically renew.
    required bool? willRenew,
  }) = _UserSubscription;

  /// An empty user subscription. I.e. a user who has not subscribed.
  const factory UserSubscription.empty({
    /// Whether the user is subscribed.
    @Default(false) bool isSubscribed,

    /// The date the subscription expires.
    DateTime? expirationDate,

    /// The type of subscription. E.g. 'Premium', 'Plus'.
    String? subscriptionType,

    /// Whether the subscription will automatically renew.
    bool? willRenew,
  }) = _UserSubscriptionEmpty;

  const UserSubscription._();

  /// Returns the time remaining on the subscription.
  Duration? get timeRemaining {
    if (expirationDate == null) {
      return null;
    }
    return DateTime.now().difference(expirationDate!);
  }
}
