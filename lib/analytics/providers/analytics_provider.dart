import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/analytics/domain/analytics_facade.dart';
import 'package:flutter_starter_template/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_provider.g.dart';

@Riverpod(keepAlive: true)
AnalyticsFacade analytics(Ref ref) {
  return AnalyticsFacade(ref.watch(analyticsRepositoryProvider));
}
