import 'package:purchases_core/src/subscription_length.dart';
import 'package:purchases_core/src/subscription_package.dart';
import 'package:test/test.dart';

void main() {
  group('SubscriptionPackage -', () {
    test(
      'Can be constructed and discount percentage is calculated correctly',
      () {
        const package = SubscriptionPackage(
          duration: SubscriptionLength.oneMonth,
          subscriptionType: 'Premium',
          identifier: 'com.example.premium',
          name: 'Premium Subscription',
          price: 9.99,
          discountedPrice: 7.99,
          currencyCode: 'USD',
        );

        expect(package.identifier, 'com.example.premium');
        expect(package.discountPercentage(), '20%');
      },
    );
  });
}
