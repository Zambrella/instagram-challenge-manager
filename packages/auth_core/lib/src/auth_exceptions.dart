/// {@template auth_exception}
/// Base class for all authentication exceptions.
/// {@endtemplate}
abstract class AuthException implements Exception {
  /// {@macro auth_exception}
  const AuthException(this.message, {this.stackTrace});

  /// A message describing the error.
  final String message;

  /// An optional stack trace for the error.
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AuthException: $message';
  }
}

/// User provided a password that does not match the password on record.
class WrongPasswordException extends AuthException {
  /// User provided a password that does not match the password on record.
  const WrongPasswordException({super.stackTrace}) : super('Wrong password');
}

/// User provided an invalid email.
class InvalidEmailException extends AuthException {
  /// User provided an invalid email.
  const InvalidEmailException({super.stackTrace}) : super('Invalid email');
}

/// User has been disabled so cannot be authenticated.
class UserDisabledException extends AuthException {
  /// User has been disabled so cannot be authenticated.
  const UserDisabledException({super.stackTrace}) : super('User disabled');
}

/// User not found in the database when trying to log in.
class UserNotFoundException extends AuthException {
  /// User not found in the database when trying to log in.
  const UserNotFoundException({super.stackTrace}) : super('User not found');
}

/// Email is already in use by another account.
class EmailAlreadyInUseException extends AuthException {
  /// Email is already in use by another account.
  const EmailAlreadyInUseException({super.stackTrace})
      : super(
          'Email already in use',
        );
}

/// Password is too weak.
class WeakPasswordException extends AuthException {
  /// Password is too weak.
  const WeakPasswordException({super.stackTrace}) : super('Weak password');
}

/// Thrown if the credential is malformed or has expired.
class InvalidCredentialException extends AuthException {
  /// Thrown if the credential is malformed or has expired.
  const InvalidCredentialException({super.stackTrace})
      : super(
          'Invalid credential',
        );
}

/// Thrown if the verification code provided is invalid.
class InvalidVerificationCodeException extends AuthException {
  /// Thrown if the verification code provided is invalid.
  const InvalidVerificationCodeException({super.stackTrace})
      : super(
          'Invalid verification code',
        );
}

/// Thrown if the user needs to reauthenticate before performing the action.
class RequiresReauthenticationException extends AuthException {
  /// Thrown if the user needs to reauthenticate before performing the action.
  const RequiresReauthenticationException({super.stackTrace})
      : super(
          'Requires reauthentication',
        );
}

/// Thrown as a general authentication error that is not covered by any other.
class UnknownAuthException extends AuthException {
  /// Thrown as a general authentication error that is not covered by any other.
  const UnknownAuthException(super.message, {super.stackTrace});
}
