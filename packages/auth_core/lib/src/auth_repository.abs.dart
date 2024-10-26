import 'package:auth_core/src/app_user.dart';
import 'package:auth_core/src/auth_exceptions.dart';
import 'package:auth_core/src/auth_social.dart';

/// {@template auth_repository}
/// An abstract class representing a repository for authentication.
/// {@endtemplate}
abstract class AuthRepository {
  /// {@macro auth_repository}
  const AuthRepository();

  /// Returns a [Stream] of the current [AppUser]. Will emit `null` if there is
  /// no user currently signed in. User state changes will emit a new stream
  /// event.
  Stream<AppUser?> getUser();

  /// Attempts to sign up a new user with the provided [email] and [password].
  /// Will return `null` if the user cancels the process.
  Future<AppUser?> signUp({required String email, required String password});

  /// Attempts to log in a user with the provided [email] and [password].
  /// Will return `null` if the user cancels the process.
  Future<AppUser?> logIn({required String email, required String password});

  /// Attempts to log in a user with the provided [socialMethod]. If no account
  /// is associated with the social account, a new account will be created.
  /// Will return `null` if the user cancels the process.
  Future<AppUser?> logInWithSocial(AuthSocial socialMethod);

  /// Logs out the current user.
  Future<void> logOut();

  /// Sends a password reset email to the provided [email].
  Future<void> forgotPassword(String email);

  /// Updates the current user's password. The [oldPassword] must be provided.
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  });

  /// Updates the current user's email. Requires password to reauthenticate the
  /// user.
  Future<void> updateEmail({
    required String newEmail,
    required String password,
  });

  /// Deletes the current user's account and logs them out.
  /// May throw a [RequiresReauthenticationException] if the user needs to
  /// reauthenticate before deleting their account.
  Future<void> deleteAccount();
}
