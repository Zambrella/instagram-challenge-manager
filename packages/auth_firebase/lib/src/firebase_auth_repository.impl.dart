import 'dart:async';
import 'dart:developer' as dev;

import 'package:auth_core/auth_core.dart';
import 'package:auth_firebase/src/firebase_auth_exception_extension.dart';
import 'package:auth_firebase/src/firebase_user_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// {@template firebase_auth_repository}
/// Firebase Authentication implementation of [AuthRepository].
/// {@endtemplate}
class FirebaseAuthRepository implements AuthRepository {
  /// {@macro firebase_auth_repository}
  const FirebaseAuthRepository(this._auth);

  final FirebaseAuth _auth;

  static const _kIsRelease = bool.fromEnvironment(
    'dart.vm.product',
    defaultValue: true,
  );

  @override
  Future<void> deleteAccount() async {
    try {
      return await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e, st) {
      throw UnknownAuthException(e.toString(), stackTrace: st);
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e, st) {
      throw UnknownAuthException(e.toString(), stackTrace: st);
    }
  }

  @override
  Stream<AppUser?> getUser() {
    return _auth.authStateChanges().handleError(
      (dynamic e, StackTrace st) {
        if (!_kIsRelease) {
          dev.log('Error in getUser', error: e, stackTrace: st);
        }
        if (e is FirebaseAuthException) {
          throw e.toAuthException();
        } else {
          throw UnknownAuthException(e.toString(), stackTrace: st);
        }
      },
    ).map(
      (user) {
        if (!_kIsRelease) {
          dev.log('User state changed: $user');
        }
        return user?.toAppUser();
      },
    );
  }

  @override
  Future<AppUser?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final creds = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return creds.user?.toAppUser();
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e, st) {
      throw UnknownAuthException(e.toString(), stackTrace: st);
    }
  }

  @override
  Future<AppUser?> logInWithSocial(AuthSocial socialMethod) async {
    final currentUser = _auth.currentUser;
    switch (socialMethod) {
      case AuthSocial.google:
        if (kIsWeb) {
          try {
            final googleProvider = GoogleAuthProvider()..addScope('email');
            late final UserCredential creds;
            if (currentUser != null && currentUser.isAnonymous) {
              creds = await currentUser.linkWithPopup(googleProvider);
              await currentUser.reload();
            } else {
              creds = await _auth.signInWithPopup(googleProvider);
            }
            return creds.user?.toAppUser();
          } on FirebaseAuthException catch (e) {
            throw e.toAuthException();
          } catch (e, st) {
            throw UnknownAuthException(e.toString(), stackTrace: st);
          }
        } else {
          try {
            final googleUser = await GoogleSignIn().signIn();
            if (googleUser != null) {
              final googleAuth = await googleUser.authentication;
              final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken,
              );
              late final UserCredential creds;
              if (currentUser != null && currentUser.isAnonymous) {
                creds = await currentUser.linkWithCredential(credential);
                await currentUser.reload();
              } else {
                creds = await _auth.signInWithCredential(credential);
              }
              return creds.user?.toAppUser();
            } else {
              // User cancelled sign in
              return null;
            }
          } on PlatformException catch (e, st) {
            if (e.code == 'sign_in_canceled') {
              // User cancelled sign in
              return null;
            } else {
              throw UnknownAuthException(e.toString(), stackTrace: st);
            }
          } on FirebaseAuthException catch (e) {
            throw e.toAuthException();
          } catch (e, st) {
            throw UnknownAuthException(e.toString(), stackTrace: st);
          }
        }
      case AuthSocial.apple:
        try {
          final appleProvider = AppleAuthProvider()..addScope('email');
          if (kIsWeb) {
            late final UserCredential creds;
            if (currentUser != null && currentUser.isAnonymous) {
              creds = await currentUser.linkWithPopup(appleProvider);
              await currentUser.reload();
            } else {
              creds = await _auth.signInWithPopup(appleProvider);
            }
            return creds.user?.toAppUser();
          } else {
            late final UserCredential creds;
            if (currentUser != null && currentUser.isAnonymous) {
              creds = await currentUser.linkWithProvider(appleProvider);
              await currentUser.reload();
            } else {
              creds = await _auth.signInWithProvider(appleProvider);
            }
            return creds.user?.toAppUser();
          }
        } on SignInWithAppleAuthorizationException catch (e, st) {
          if (e.code == AuthorizationErrorCode.canceled) {
            // User cancelled sign in
            return null;
          } else {
            throw UnknownAuthException(e.toString(), stackTrace: st);
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'canceled') {
            // User cancelled sign in
            return null;
          } else {
            throw e.toAuthException();
          }
        } on PlatformException catch (e, st) {
          if (e.code == 'sign_in_canceled') {
            // User cancelled sign in
            return null;
          } else {
            throw UnknownAuthException(e.toString(), stackTrace: st);
          }
        } catch (e, st) {
          throw UnknownAuthException(e.toString(), stackTrace: st);
        }
      case AuthSocial.facebook:
        throw UnimplementedError('Facebook login is not yet implemented');
    }
  }

  @override
  Future<void> logOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e, st) {
      throw UnknownAuthException(e.toString(), stackTrace: st);
    }
  }

  @override
  Future<AppUser?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null && currentUser.isAnonymous) {
        final credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );
        final creds = await currentUser.linkWithCredential(credential);
        // Reloading as a workaround for this issue: https://github.com/firebase/flutterfire/issues/11520
        await currentUser.reload();
        return creds.user?.toAppUser();
      } else {
        final creds = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return creds.user?.toAppUser();
      }
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e, st) {
      throw UnknownAuthException(e.toString(), stackTrace: st);
    }
  }

  @override
  Future<void> updateEmail({
    required String newEmail,
    required String password,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user?.email != null) {
        final cred = EmailAuthProvider.credential(
          email: user!.email!,
          password: password,
        );
        await user.reauthenticateWithCredential(cred);
        await user.verifyBeforeUpdateEmail(newEmail);
        return;
      }
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e, st) {
      throw UnknownAuthException(e.toString(), stackTrace: st);
    }
  }

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user?.email != null) {
        final cred = EmailAuthProvider.credential(
          email: user!.email!,
          password: oldPassword,
        );
        await user.reauthenticateWithCredential(cred);
        await user.updatePassword(newPassword);
        return;
      }
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e, st) {
      throw UnknownAuthException(e.toString(), stackTrace: st);
    }
  }

  /// Create an account for the user without requiring any user information.
  Future<AppUser?> signUpAnonymously() async {
    try {
      final creds = await _auth.signInAnonymously();
      return creds.user?.toAppUser();
    } on FirebaseAuthException catch (e) {
      throw e.toAuthException();
    } catch (e, st) {
      throw UnknownAuthException(e.toString(), stackTrace: st);
    }
  }
}
