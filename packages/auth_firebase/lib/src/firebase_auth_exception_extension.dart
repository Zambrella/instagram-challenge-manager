import 'package:auth_core/auth_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Extension on [FirebaseAuthException] to convert to [AuthException].
extension FirebaseAuthExceptionX on FirebaseAuthException {
  /// Converts a [FirebaseAuthException] to an [AuthException].
  AuthException toAuthException() {
    switch (code) {
      case 'email-already-in-use':
        return EmailAlreadyInUseException(stackTrace: stackTrace);
      case 'user-not-found':
        return UserNotFoundException(stackTrace: stackTrace);
      case 'wrong-password':
        return WrongPasswordException(stackTrace: stackTrace);
      case 'user-disabled':
        return UserDisabledException(stackTrace: stackTrace);
      case 'invalid-email':
        return InvalidEmailException(stackTrace: stackTrace);
      case 'weak-password':
        return WeakPasswordException(stackTrace: stackTrace);
      case 'invalid-credential':
        return InvalidCredentialException(stackTrace: stackTrace);
      case 'invalid-verification-code':
        return InvalidVerificationCodeException(stackTrace: stackTrace);
      default:
        return UnknownAuthException(
          'Unknown error: $code - ${message ?? 'No message'}',
          stackTrace: stackTrace,
        );
    }
  }
}
