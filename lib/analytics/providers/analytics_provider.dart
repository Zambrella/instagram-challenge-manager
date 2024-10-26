import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/analytics/domain/analytics_facade.dart';
import 'package:instagram_challenge_manager/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_provider.g.dart';

@Riverpod(keepAlive: true)
AnalyticsFacade analytics(Ref ref) {
  return AnalyticsFacade(ref.watch(analyticsRepositoryProvider));
}
