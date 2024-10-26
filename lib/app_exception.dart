import 'package:auth_core/auth_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/l10n/gen_l10n/app_localizations.dart';

extension ObjectExceptionX on Object {
  /// Returns a helpful, translated, error message if the [Object] is expected to be an [Exception] or [Error].
  /// This is intended to be used for messages that will be shown to the user.
  /// This should be called in the widget and not in the business logic/provider.
  String errorMessage(BuildContext context) {
    final loc = AppLocalizations.of(context);
    if (this is Exception) {
      return switch (this as Exception) {
        final AuthException authException => switch (authException) {
            WrongPasswordException() => loc.wrongPassword,
            InvalidEmailException() => loc.invalidEmail,
            UserDisabledException() => loc.userDisabled,
            UserNotFoundException() => loc.userNotFound,
            EmailAlreadyInUseException() => loc.emailInUse,
            WeakPasswordException() => loc.weakPassword,
            InvalidCredentialException() => loc.invalidCredential,
            RequiresReauthenticationException() => loc.requiredReauthentication,
            UnknownAuthException() => loc.unknownAuthError,
            _ => loc.unknownAuthError,
          },
        final Exception exception => '${loc.unknownError} - ${formatException(exception)}',
      };
    } else {
      return toString();
    }
  }
}

String formatException(Exception exception) {
  var message = exception.toString();
  if (message.startsWith('Exception: ')) {
    message = message.replaceFirst('Exception: ', '');
  }
  return message;
}
