/// {@template error_logging_repository}
/// {@endtemplate}
abstract class ErrorLoggingRepository {
  /// {@macro error_logging_repository}
  const ErrorLoggingRepository();

  /// Logs an exception with an optional error and stack trace.
  Future<void> logException(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    bool? isFatal,
  });

  /// Logs a message with an optional stack trace.
  /// This is useful for logging messages that are not errors.
  Future<void> logMessage(
    String message, {
    StackTrace? stackTrace,
  });

  /// Enables or disables logging.
  /// Pass `true` to enable logging and `false` to disable logging.
  Future<void> enableLogging({required bool enable});

  /// Sets the user ID for error logging.
  Future<void> setUserId(String userId);

  /// Unsets the user ID for error logging.
  /// Likely called when a user logs out.
  Future<void> unsetUserId();

  /// Initializes the error logging service.
  Future<void> init();
}
