import 'package:analytics_core/src/custom_analytics_event.dart';
import 'package:analytics_core/src/server_location.dart';
import 'package:analytics_core/src/user_property.dart';

/// {@template analytics_repository}
/// Abstract class for analytics repository.
/// Contains methods to log events, set user properties and enable/disable analytics.
/// {@endtemplate}
abstract class AnalyticsRepository {
  /// {@macro analytics_repository}
  const AnalyticsRepository();

  /// Initializes the analytics repository.
  /// Does not have to be called before other methods but would be a good
  /// place to set up any required configurations.
  Future<void> init({ServerLocation? serverLocation});

  /// Returns whether analytics is enabled.
  Future<bool> isEnabled();

  /// Enables or disables analytics.
  Future<void> enableAnalytics({required bool enable});

  /// Disables analytics.
  Future<void> disableAnalytics() => enableAnalytics(enable: false);

  /// Logs an event with the given [event].
  Future<void> logCustomEvent(CustomAnalyticsEvent event);

  /// Sets a user property with the given [userProperty].
  Future<void> setUserProperty(UserProperty userProperty);

  /// Sets the user ID to the given [userId].
  /// Should be called when logging in a user.
  Future<void> setUserId(String userId);

  /// Unsets the user ID.
  /// Should be called when logging out a user.
  Future<void> unsetUserId();

  /// Sets the server location of the analytics service to the given [location].
  Future<void> setServerLocation(ServerLocation location);

  // TODO: Add e-commerce methods

  // TODO: Add game methods

  // TODO: Add screen tracking methods

  // TODO: Add advertising methods

  // TODO: Add in-app purchase methods
}
