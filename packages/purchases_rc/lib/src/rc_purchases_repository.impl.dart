import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:purchases_core/purchases_core.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:rxdart/rxdart.dart';

/// {@template rc_purchases_repository}
/// Revenue Cat implementation of [PurchasesRepository].
/// Must be initialised first with [init] before any other methods can be
/// called.
/// Internally is handles it's own stream controller to listen for any changes.
/// {@endtemplate}
class RcPurchasesRepository implements PurchasesRepository {
  /// {@macro rc_purchases_repository}
  RcPurchasesRepository(this._entitlementId);

  final String _entitlementId;

  final StreamController<UserSubscription> _controller = BehaviorSubject();

  void _purchaserListener(CustomerInfo purchaserInfo) {
    try {
      if (purchaserInfo.entitlements.all[_entitlementId] != null) {
        final userSubscription = UserSubscription(
          isSubscribed: purchaserInfo.entitlements.all[_entitlementId]!.isActive,
          expirationDate: DateTime.parse(purchaserInfo.latestExpirationDate!),
          subscriptionType: _entitlementId,
          willRenew: purchaserInfo.entitlements.all[_entitlementId]!.willRenew,
        );
        _controller.add(userSubscription);
      } else {
        _controller.add(const UserSubscription.empty());
      }
    } catch (e, st) {
      _controller.addError(e, st);
    }
  }

  @override
  Future<void> init({
    required bool isDebugMode,
    bool isAndroid = true,
    String? androidApiKey,
    String? iosApiKey,
  }) async {
    if (androidApiKey == null || iosApiKey == null) {
      throw InitPurchasesException(
        'API Key is required to initialise RevenueCat',
        stackTrace: StackTrace.current,
      );
    }
    // Set log level
    if (isDebugMode) {
      await Purchases.setLogLevel(LogLevel.verbose);
    }

    // Initialise with appIds
    try {
      late final PurchasesConfiguration purchasesConfiguration;
      if (isAndroid) {
        purchasesConfiguration = PurchasesConfiguration(androidApiKey);
      } else {
        purchasesConfiguration = PurchasesConfiguration(iosApiKey);
      }

      await Purchases.configure(purchasesConfiguration);
    } catch (e, st) {
      throw InitPurchasesException(e.toString(), stackTrace: st);
    }

    // Set up listener for any purchase changes
    Purchases.addCustomerInfoUpdateListener(_purchaserListener);
  }

  @override
  Future<List<SubscriptionPackage>> fetchSubscriptionPackages() async {
    try {
      final offerings = await Purchases.getOfferings();
      final defaultOffering = offerings.current;
      final packages = defaultOffering?.availablePackages;
      if (packages == null) {
        throw NoPackagesAvailableException(
          'No packages available from default offering',
          stackTrace: StackTrace.current,
        );
      }
      final subscriptionPackages = await Future.wait(
        packages.map(
          (package) async {
            final productIdentifier = package.storeProduct.identifier; // prints productId:planId on android
            double? discountedPrice;

            if (Platform.isIOS) {
              final userCanHaveIntroResult = await Purchases.checkTrialOrIntroductoryPriceEligibility([productIdentifier]);
              final introEligibilityStatus = userCanHaveIntroResult[productIdentifier]?.status;
              final packageCanHaveIntro = introEligibilityStatus == IntroEligibilityStatus.introEligibilityStatusEligible;
              if (packageCanHaveIntro) {
                final introPrice = package.storeProduct.introductoryPrice;
                discountedPrice = introPrice?.price;
              }
            }

            if (Platform.isAndroid) {
              final offers = package.storeProduct.subscriptionOptions;
              if (offers != null) {
                final relevantOffer = offers.firstWhereOrNull((offer) => offer.storeProductId == productIdentifier);
                if (relevantOffer != null) {
                  // Google Play determines if the user is eligible for an introductory price
                  final priceInMicros = relevantOffer.introPhase?.price.amountMicros;
                  if (priceInMicros != null) {
                    discountedPrice = (priceInMicros / 1000000).toPrecision(2);
                  }
                }
              }
            }

            return SubscriptionPackage(
              duration: package.packageType.convertToSubscriptionLength(),
              subscriptionType: _entitlementId,
              identifier: productIdentifier,
              name: package.storeProduct.title,
              price: package.storeProduct.price,
              discountedPrice: discountedPrice,
              currencyCode: package.storeProduct.currencyCode,
            );
          },
        ),
      );
      return subscriptionPackages;
    } on NoPackagesAvailableException {
      rethrow;
    } catch (e, st) {
      throw UnknownPurchasesException(e.toString(), stackTrace: st);
    }
  }

  @override
  Stream<UserSubscription> getActiveSubscription() {
    return _controller.stream;
  }

  @override
  Future<void> purchaseSubscription(SubscriptionPackage userSelectedPackage) async {
    try {
      final offerings = await Purchases.getOfferings();
      final defaultOffering = offerings.current;
      final packages = defaultOffering?.availablePackages;
      final selectedPackage = packages?.firstWhereOrNull((package) => package.storeProduct.identifier == userSelectedPackage.identifier);
      if (selectedPackage == null) {
        throw NoPackagesAvailableException(
          'No packages available from default offering',
          stackTrace: StackTrace.current,
        );
      } else {
        await Purchases.purchasePackage(selectedPackage);
      }
    } on PlatformException catch (e, st) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      switch (errorCode) {
        case PurchasesErrorCode.purchaseCancelledError:
          throw UserCancelledPurchaseException(
            errorCode.name,
            stackTrace: st,
          );
        // TODO: Add more cases
        // ignore: no_default_cases
        default:
          throw UnknownPurchasesException(errorCode.name, stackTrace: st);
      }
    } on NoPackagesAvailableException {
      rethrow;
      // Thrown from `firstWhere` function if it cannot find matching element
    } catch (e, st) {
      throw UnknownPurchasesException(
        e.toString(),
        stackTrace: st,
      );
    }
  }

  @override
  Future<void> refresh() async {
    return Purchases.invalidateCustomerInfoCache();
  }

  @override
  Future<void> restorePurchase() async {
    try {
      // TODO: Doesn't throw if nothing happens. Need to check if the user has premium access and throw if not
      await Purchases.restorePurchases();
    } on PlatformException catch (e, st) {
      throw RestorePurchaseException(
        e.toString(),
        stackTrace: st,
      );
    } catch (e, st) {
      throw UnknownPurchasesException(
        e.toString(),
        stackTrace: st,
      );
    }
  }

  @override
  Future<void> setUserId(String userId) async {
    await Purchases.logIn(userId);
  }

  @override
  Future<void> unsetUserId() async {
    await Purchases.logOut();
  }
}

extension on PackageType {
  SubscriptionLength convertToSubscriptionLength() {
    switch (this) {
      case PackageType.annual:
        return SubscriptionLength.oneYear;
      case PackageType.monthly:
        return SubscriptionLength.oneMonth;
      case PackageType.lifetime:
        return SubscriptionLength.lifetime;
      case PackageType.sixMonth:
        return SubscriptionLength.sixMonths;
      case PackageType.threeMonth:
        return SubscriptionLength.threeMonths;
      case PackageType.twoMonth:
        return SubscriptionLength.twoMonths;
      case PackageType.weekly:
        return SubscriptionLength.oneWeek;
      case PackageType.custom:
        return SubscriptionLength.unknown;
      case PackageType.unknown:
        return SubscriptionLength.unknown;
    }
  }
}

extension on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
