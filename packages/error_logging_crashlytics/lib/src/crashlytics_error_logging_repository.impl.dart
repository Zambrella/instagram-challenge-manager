import 'package:error_logging_core/error_logging_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

/// {@template crashlytics_error_logging_repository}
/// Firebase Crashlytics implementation of [ErrorLoggingRepository].
/// {@endtemplate}
class CrashlyticsErrorLoggingRepository implements ErrorLoggingRepository {
  /// {@macro crashlytics_error_logging_repository}
  const CrashlyticsErrorLoggingRepository(this._crashlytics);

  final FirebaseCrashlytics _crashlytics;

  @override
  Future<void> enableLogging({required bool enable}) async {
    return _crashlytics.setCrashlyticsCollectionEnabled(enable);
  }

  @override
  Future<void> logException(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    bool? isFatal,
  }) async {
    return _crashlytics.recordError(error, stackTrace, reason: message, fatal: isFatal ?? false);
  }

  @override
  Future<void> logMessage(
    String message, {
    StackTrace? stackTrace,
  }) async {
    return _crashlytics.log(message);
  }

  @override
  Future<void> setUserId(String userId) async {
    return _crashlytics.setUserIdentifier(userId);
  }

  @override
  Future<void> init() async {
    return;
  }

  @override
  Future<void> unsetUserId() async {
    return;
  }
}
