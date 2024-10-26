/// {@template purchases_exception}
/// Base class for all purchase related exceptions.
/// {@endtemplate}
abstract class PurchasesException implements Exception {
  /// {@macro purchases_exception}
  const PurchasesException(this.message, {this.stackTrace});

  /// A message describing the error.
  final String message;

  /// An optional stack trace for the error.
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'Purchase Exception: $message';
  }
}

/// {@template init_purchases_exception}
/// Exception thrown when there is an error initializing the service.
/// {@endtemplate}
class InitPurchasesException extends PurchasesException {
  /// {@macro init_purchases_exception}
  const InitPurchasesException(super.message, {super.stackTrace});
}

/// {@template no_packages_available_exception}
/// Exception thrown when there are no packages available.
/// {@endtemplate}
class NoPackagesAvailableException extends PurchasesException {
  /// {@macro no_packages_available_exception}
  const NoPackagesAvailableException(super.message, {super.stackTrace});
}

/// {@template user_cancelled_purchase_exception}
/// Exception thrown when the user cancels during the purchase process.
/// {@endtemplate}
class UserCancelledPurchaseException extends PurchasesException {
  /// {@macro user_cancelled_purchase_exception}
  const UserCancelledPurchaseException(super.message, {super.stackTrace});
}

/// {@template restore_purchase_exception}
/// Exception thrown when there is an error restoring purchases.
/// {@endtemplate}
class RestorePurchaseException extends PurchasesException {
  /// {@macro restore_purchase_exception}
  const RestorePurchaseException(super.message, {super.stackTrace});
}

/// {@template unknown_purchases_exception}
/// Exception thrown when there is an unknown error with purchases.
/// {@endtemplate}
class UnknownPurchasesException extends PurchasesException {
  /// {@macro unknown_purchases_exception}
  const UnknownPurchasesException(super.message, {super.stackTrace});
}
