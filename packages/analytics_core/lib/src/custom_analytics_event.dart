/// {@template analytics_event}
/// An abstract class that represents an analytics event.
/// When creating a new event to track, extend this class and provide the event
/// name and parameters.
/// {@endtemplate}
abstract class CustomAnalyticsEvent {
  /// {@macro analytics_event}
  const CustomAnalyticsEvent(
    this.eventName, {
    this.parameters,
  });

  /// The name of the event.
  final String eventName;

  /// Additional parameters to track with the event.
  final Map<String, Object>? parameters;

  @override
  String toString() {
    return 'AnalyticsEvent: $eventName, parameters: $parameters';
  }
}
