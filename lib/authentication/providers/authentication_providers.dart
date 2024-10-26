import 'package:auth_core/auth_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_providers.g.dart';

@Riverpod(keepAlive: true)
Stream<AppUser?> authStateChanges(Ref ref) {
  return ref.watch(authRepositoryProvider).getUser();
}

@Riverpod(keepAlive: true)
AppUser? currentUser(Ref ref) {
  return ref.watch(authStateChangesProvider).value;
}
