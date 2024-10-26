import 'package:purchases_core/src/subscription_package.dart';
import 'package:purchases_core/src/user_subscription.dart';

/// {@template purchases_repository}
/// Abstract interface for in app purchases and subscriptions.
/// {@endtemplate}
abstract class PurchasesRepository {
  /// {@macro subscription_service}
  const PurchasesRepository();

  /// Initializes the service.
  /// Likely to be called at the start of the app.
  Future<void> init({required bool isDebugMode});

  /// Fetches the available subscription packages.
  Future<List<SubscriptionPackage>> fetchSubscriptionPackages();

  /// Purchases a subscription package.
  Future<void> purchaseSubscription(SubscriptionPackage package);

  /// Fetches the active subscription.
  Stream<UserSubscription> getActiveSubscription();

  /// Refresh the service.
  Future<void> refresh();

  /// Restore an already purchased subscription.
  Future<void> restorePurchase();

  /// Logs in the user.
  Future<void> setUserId(String userId);

  /// Logs out the user.
  Future<void> unsetUserId();
}
