import 'package:analytics_core/analytics_core.dart';
import 'package:appwrite/appwrite.dart';
import 'package:auth_appwrite/auth_appwrite.dart';
import 'package:data_privacy/data_privacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:instagram_challenge_manager/app_dependencies.dart';
import 'package:purchases_core/purchases_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  // requiredValue is possible because `appDependenciesProvider` is loaded in `lib/app.dart`
  return ref.watch(
    appDependenciesProvider
        .select((deps) => deps.requireValue.sharedPreferences),
  );
}

@Riverpod(keepAlive: true)
Client appwriteClient(Ref ref) {
  return ref.watch(appDependenciesProvider
      .select((deps) => deps.requireValue.backendClient));
}

@Riverpod(keepAlive: true)
Account appwriteAccountClient(Ref ref) {
  return Account(ref.watch(appwriteClientProvider));
}

@Riverpod(keepAlive: true)
Databases appwriteDatabaseClient(Ref ref) {
  return Databases(ref.watch(appwriteClientProvider));
}

@Riverpod(keepAlive: true)
Storage appwriteStorageClient(Ref ref) {
  return Storage(ref.watch(appwriteClientProvider));
}

@Riverpod(keepAlive: true)
AppwriteAuthRepository authRepository(Ref ref) {
  return AppwriteAuthRepository(
    ref.watch(appwriteAccountClientProvider),
    ref.watch(secureStorageProvider),
  );
}

@Riverpod(keepAlive: true)
AnalyticsRepository analyticsRepository(Ref ref) {
  return FakeAnalyticsRepository();
}

@Riverpod(keepAlive: true)
PurchasesRepository purchasesRepository(Ref ref) {
  return FakePurchasesRepository();
}

@Riverpod(keepAlive: true)
DataPrivacyRepository dataPrivacyRepository(Ref ref) {
  return DataPrivacyRepository(ref.watch(sharedPreferencesProvider));
}

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}
