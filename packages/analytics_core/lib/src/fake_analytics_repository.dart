import 'dart:developer';

import 'package:analytics_core/analytics_core.dart';

/// A fake implementation of [AnalyticsRepository] for testing.
class FakeAnalyticsRepository implements AnalyticsRepository {
  /// A fake implementation of [AnalyticsRepository] for testing.
  FakeAnalyticsRepository()
      : _userId = null,
        _serverLocation = null,
        _enabled = false;

  String? _userId;
  ServerLocation? _serverLocation;
  bool? _enabled;
  final Map<String, dynamic> _userProperties = {};
  final List<Map<String, dynamic>> _events = [];

  @override
  Future<void> init({ServerLocation? serverLocation}) async {
    log('Initializing fake analytics repository', name: 'FakeAnalyticsRepository');
    _serverLocation = serverLocation;
  }

  @override
  Future<bool> isEnabled() async {
    log('Checking if analytics is enabled: $_enabled', name: 'FakeAnalyticsRepository');
    return Future.value(_enabled ?? false);
  }

  @override
  Future<void> enableAnalytics({required bool enable}) async {
    log('Setting enabled status to: $enable', name: 'FakeAnalyticsRepository');
    _enabled = enable;
  }

  @override
  Future<void> disableAnalytics() => enableAnalytics(enable: false);

  @override
  Future<void> logCustomEvent(CustomAnalyticsEvent event) async {
    _events.add({event.eventName: event.parameters});
    log(dump(), name: 'FakeAnalyticsRepository');
  }

  @override
  Future<void> setServerLocation(ServerLocation location) async {
    log('Setting server location', name: 'FakeAnalyticsRepository');
    _serverLocation = location;
  }

  @override
  Future<void> setUserId(String userId) async {
    log('Setting user id', name: 'FakeAnalyticsRepository');
    _userId = userId;
  }

  @override
  Future<void> setUserProperty(UserProperty userProperty) async {
    log('Setting user property', name: 'FakeAnalyticsRepository');
    _userProperties[userProperty.name] = userProperty.value;
    log(dump(), name: 'FakeAnalyticsRepository');
  }

  @override
  Future<void> unsetUserId() async {
    log('Unsetting user id', name: 'FakeAnalyticsRepository');
    _userId = null;
    _userProperties.clear();
    _events.clear();
    _enabled = false;
    _serverLocation = null;
  }

  /// Returns a string representation of the data stored.
  String dump() {
    return 'userId: $_userId, serverLocation: $_serverLocation, enabled: $_enabled, userProperties: $_userProperties, events: $_events';
  }
}
