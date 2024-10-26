import 'package:auth_core/auth_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Extension on [User] to convert to [AppUser].
extension FirebaseUserX on User {
  /// Converts a [User] to an [AppUser].
  AppUser toAppUser() {
    final providers = providerData.map((e) => e.providerId);

    AuthMethod? authMethod;

    for (final provider in providers) {
      if (provider.contains('google')) {
        authMethod = AuthMethod.google;
        break;
      } else if (provider.contains('apple')) {
        authMethod = AuthMethod.apple;
        break;
      } else if (provider.contains('facebook')) {
        authMethod = AuthMethod.facebook;
        break;
      }
    }

    return AppUser(
      id: uid,
      authMethod: authMethod ?? AuthMethod.email,
      email: email,
      name: displayName,
      photoUrl: photoURL,
    );
  }
}
