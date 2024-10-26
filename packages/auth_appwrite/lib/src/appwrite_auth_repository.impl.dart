import 'dart:async';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:auth_core/auth_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';

/// {@template appwrite_auth_repository}
/// An implementation of [AuthRepository] that uses Appwrite.
/// {@endtemplate}
class AppwriteAuthRepository implements AuthRepository {
  /// {@macro appwrite_auth_repository}
  AppwriteAuthRepository(this._account, this._secureStorage) {
    log(
      'AppwriteAuthRepository created',
      name: 'AppwriteAuthRepository',
    );
    _userController = BehaviorSubject(
      onListen: () async {
        try {
          final sessionToken = await _secureStorage.read(key: _sessionKey);
          if (sessionToken != null) {
            log(
              'Session token found',
              name: 'AppwriteAuthRepository',
            );
            log(
              'Getting user',
              name: 'AppwriteAuthRepository',
            );
            final user = await _account.get();
            log(
              'User found: ${user.email}',
              name: 'AppwriteAuthRepository',
            );
            _userController.add(user.toAppUser());
          } else {
            log(
              'No session token found',
              name: 'AppwriteAuthRepository',
            );
            _userController.add(null);
          }
        } on AppwriteException catch (e, st) {
          log(
            'Deleting session key',
            name: 'AppwriteAuthRepository',
          );
          await _secureStorage.delete(key: _sessionKey);
          if (e.code == 401) {
            log(
              'User not logged in',
              name: 'AppwriteAuthRepository',
            );
            _userController.add(null);
          } else {
            log('Error getting user',
                error: e, stackTrace: st, name: 'AppwriteAuthRepository');
            _userController.addError(e);
          }
        } catch (e, st) {
          log(
            'Error getting user',
            error: e,
            stackTrace: st,
            name: 'AppwriteAuthRepository',
          );
          log(
            'Deleting session key',
            name: 'AppwriteAuthRepository',
          );
          await _secureStorage.delete(key: _sessionKey);
          _userController.addError(e, st);
        }
      },
      onCancel: () async {
        log(
          'Closing user controller',
          name: 'AppwriteAuthRepository',
        );
        await _userController.close();
      },
    );
  }

  final Account _account;
  final FlutterSecureStorage _secureStorage;

  late final BehaviorSubject<AppUser?> _userController;

  static const _sessionKey = 'session_token';

  @override
  Future<void> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Stream<AppUser?> getUser() {
    return _userController.stream;
  }

  @override
  Future<AppUser?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final session = await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      await _secureStorage.write(key: _sessionKey, value: session.$id);
      log('User logged in and session token saved',
          name: 'AppwriteAuthRepository');
      final user = await _account.get();
      log('Logged in user: ${user.email}', name: 'AppwriteAuthRepository');
      final appUser = user.toAppUser();
      log('Adding user to controller', name: 'AppwriteAuthRepository');
      _userController.add(appUser);
      return appUser;
    } catch (e, st) {
      log(
        'Error logging in',
        error: e,
        stackTrace: st,
        name: 'AppwriteAuthRepository',
      );
      rethrow;
    }
  }

  @override
  Future<AppUser?> logInWithSocial(AuthSocial socialMethod) {
    // TODO: implement logInWithSocial
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    try {
      await _account.deleteSession(sessionId: 'current');
      await _secureStorage.delete(key: _sessionKey);
      _userController.add(null);
    } catch (e, st) {
      log(
        'Error logging out',
        error: e,
        stackTrace: st,
        name: 'AppwriteAuthRepository',
      );
      rethrow;
    }
  }

  @override
  Future<AppUser?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      log(
        'Signed up user: ${user.email}',
        name: 'AppwriteAuthRepository',
      );
      final _ = await logIn(email: email, password: password);
      final appUser = user.toAppUser();
      return appUser;
    } catch (e, st) {
      log(
        'Error signing up',
        error: e,
        stackTrace: st,
        name: 'AppwriteAuthRepository',
      );
      rethrow;
    }
  }

  @override
  Future<void> updateEmail({
    required String newEmail,
    required String password,
  }) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}

extension on User {
  AppUser toAppUser() {
    return AppUser(
      id: $id,
      authMethod: AuthMethod.email,
      email: email,
      name: name,
    );
  }
}
