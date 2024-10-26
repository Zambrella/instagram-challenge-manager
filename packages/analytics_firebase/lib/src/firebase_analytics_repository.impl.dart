import 'package:analytics_core/analytics_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

/// {@template firebase_analytics_repository}
/// Firebase implementation of [AnalyticsRepository].
/// Requires additional setup in the app's `android` and `ios` directories.
/// {@endtemplate}
class FirebaseAnalyticsRepository implements AnalyticsRepository {
  /// {@macro firebase_analytics_repository}
  const FirebaseAnalyticsRepository(this._analytics);

  final FirebaseAnalytics _analytics;

  @override
  Future<void> init({ServerLocation? serverLocation}) async {
    try {
      // Do nothing
    } catch (e) {
      throw Exception('Failed to initialize analytics: $e');
    }
  }

  @override
  Future<bool> isEnabled() {
    throw UnimplementedError();
  }

  @override
  Future<void> enableAnalytics({required bool enable}) {
    try {
      return _analytics.setAnalyticsCollectionEnabled(enable);
    } catch (e) {
      throw Exception('Failed to enable analytics: $e');
    }
  }

  @override
  Future<void> disableAnalytics() => enableAnalytics(enable: false);

  @override
  Future<void> logCustomEvent(CustomAnalyticsEvent event) async {
    try {
      await _analytics.logEvent(
        name: event.eventName,
        parameters: event.parameters,
      );
    } catch (e) {
      throw Exception('Failed to log event: $e');
    }
  }

  @override
  Future<void> setServerLocation(ServerLocation location) {
    throw UnimplementedError();
  }

  @override
  Future<void> setUserId(String userId) async {
    try {
      return _analytics.setUserId(id: userId);
    } catch (e) {
      throw Exception('Failed to set user ID: $e');
    }
  }

  @override
  Future<void> setUserProperty(UserProperty userProperty) async {
    assert(
      // ignore: lines_longer_than_80_chars
      userProperty.name != 'Age' && userProperty.value != 'Gender' && userProperty.name != 'Interest',
      'Reserved user property name',
    );
    assert(
      !userProperty.name.startsWith('firebase_'),
      'Property name cannot start with "firebase_"',
    );
    assert(
      userProperty.name.isNotEmpty && userProperty.name.length <= 24,
      'Property name must be between 1 and 24 characters long',
    );
    try {
      await _analytics.setUserProperty(
        name: userProperty.name,
        value: userProperty.value.toString(),
      );
    } catch (e) {
      throw Exception('Failed to set user property: $e');
    }
  }

  @override
  Future<void> unsetUserId() async {
    try {
      // ignore: avoid_redundant_argument_values
      return _analytics.setUserId(id: null);
    } catch (e) {
      throw Exception('Failed to unset user ID: $e');
    }
  }
}
