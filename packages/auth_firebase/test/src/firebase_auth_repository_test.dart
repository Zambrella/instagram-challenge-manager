import 'dart:async';

import 'package:auth_core/auth_core.dart';
import 'package:auth_firebase/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_exceptions/mock_exceptions.dart';

void main() {
  const validEmail = 'email@email.com';
  const invalidEmail = 'email.com';
  const validPassword = 'Password123';
  const invalidPassword = 'abc';

  group('deleteAccount() -', () {
    // Deleting account is not supported by the mock package
    test('Deleting account works as expected', () async {
      final mockUser = MockUser();
      final mockAuth = MockFirebaseAuth(
        mockUser: mockUser,
        signedIn: true,
      );
      final repo = FirebaseAuthRepository(mockAuth);

      await expectLater(repo.deleteAccount(), completes);
    });
  });

  group('forgotPassword() -', () {
    test('User is sent a password reset email', () async {
      final mockUser = MockUser();
      final mockAuth = MockFirebaseAuth(
        mockUser: mockUser,
        signedIn: true,
      );
      final repo = FirebaseAuthRepository(mockAuth);

      await expectLater(repo.forgotPassword(validEmail), completes);
    });
  });

  group('signUp() -', () {
    test(
      // ignore: lines_longer_than_80_chars
      "User can create an account with email & password and the user's auth state changes",
      () async {
        final mockUser = MockUser();
        final mockAuth = MockFirebaseAuth(
          mockUser: mockUser,
        );
        final repo = FirebaseAuthRepository(mockAuth);

        unawaited(
          expectLater(
            repo.getUser(),
            emitsInOrder(
              [
                isNull,
                isNotNull,
              ],
            ),
          ),
        );

        await repo.signUp(email: validEmail, password: validPassword);
      },
    );
    test('Correct exception thrown when given an invalid email', () async {
      final mockUser = MockUser();
      final mockAuth = MockFirebaseAuth(
        mockUser: mockUser,
      );
      final repo = FirebaseAuthRepository(mockAuth);

      whenCalling(
        Invocation.method(
          #createUserWithEmailAndPassword,
          null,
        ),
      ).on(mockAuth).thenThrow(
            FirebaseAuthException(code: 'invalid-email'),
          );

      expect(
        repo.signUp(email: invalidEmail, password: validPassword),
        throwsA(isA<InvalidEmailException>()),
      );
    });

    test('Correct exception thrown when given an invalid password', () async {
      final mockUser = MockUser();
      final mockAuth = MockFirebaseAuth(
        mockUser: mockUser,
      );
      final repo = FirebaseAuthRepository(mockAuth);

      whenCalling(
        Invocation.method(
          #createUserWithEmailAndPassword,
          null,
        ),
      ).on(mockAuth).thenThrow(
            FirebaseAuthException(code: 'weak-password'),
          );

      expect(
        repo.signUp(email: validEmail, password: invalidPassword),
        throwsA(isA<WeakPasswordException>()),
      );
    });
  });

  group('logOut() -', () {
    test('User can logout without errors and auth state changes', () async {
      final mockUser = MockUser();
      final mockAuth = MockFirebaseAuth(
        signedIn: true,
        mockUser: mockUser,
      );
      final repo = FirebaseAuthRepository(mockAuth);

      unawaited(
        expectLater(
          repo.getUser(),
          emitsInOrder(
            [
              isNotNull,
              isNull,
            ],
          ),
        ),
      );

      await expectLater(repo.logOut(), completes);
    });
  });
}
