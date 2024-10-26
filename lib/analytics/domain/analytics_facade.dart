import 'package:analytics_core/analytics_core.dart';

final class AnalyticsFacade {
  const AnalyticsFacade(this._repository);

  // ignore: unused_field
  final AnalyticsRepository _repository;

  Future<void> trackScreen(String screenName) async {
    // Track screen
  }
}
