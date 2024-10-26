// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:error_logging_core/src/error_logging_repository.abs.dart';

/// {@template fake_error_logging_repository}
/// {@endtemplate}
class FakeErrorLoggingRepository implements ErrorLoggingRepository {
  /// {@macro fake_error_logging_repository}
  FakeErrorLoggingRepository();

  final List<String> _loggedMessages = [];
  final List<String> _loggedExceptions = [];
  String? _userId;
  bool _loggingEnabled = false;

  @override
  Future<void> logException(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    bool? isFatal,
  }) async {
    log(
      'Logging exception: $message',
      error: error,
      stackTrace: stackTrace,
      name: 'FakeErrorLoggingRepository',
    );
    _loggedExceptions.add(message);
  }

  @override
  Future<void> logMessage(
    String message, {
    StackTrace? stackTrace,
  }) async {
    log(
      'Logging message: $message',
      stackTrace: stackTrace,
      name: 'FakeErrorLoggingRepository',
    );
    _loggedMessages.add(message);
  }

  @override
  Future<void> enableLogging({required bool enable}) async {
    _loggingEnabled = enable;
    log('Logging enabled: $_loggingEnabled', name: 'FakeErrorLoggingRepository');
  }

  @override
  Future<void> setUserId(String userId) async {
    _userId = userId;
    log('Setting user ID: $_userId', name: 'FakeErrorLoggingRepository');
  }

  /// Dumps the logs and user ID to a string.
  String dumpLogs() {
    return 'Logged messages: $_loggedMessages\nLogged exceptions: $_loggedExceptions\nUser ID: $_userId\nLogging enabled: $_loggingEnabled';
  }

  @override
  Future<void> init() async {
    log('Initializing error logging service', name: 'FakeErrorLoggingRepository');
    return;
  }

  @override
  Future<void> unsetUserId() async {
    _userId = null;
    log('Unsetting user ID: $_userId', name: 'FakeErrorLoggingRepository');
  }
}
