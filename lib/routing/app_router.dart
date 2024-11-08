import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_challenge_manager/authentication/presentation/pages/login_page.dart';
import 'package:instagram_challenge_manager/authentication/providers/authentication_providers.dart';
import 'package:instagram_challenge_manager/challenge/presentation/pages/challenge_details_page.dart';
import 'package:instagram_challenge_manager/home/presentation/pages/home_page.dart';
import 'package:instagram_challenge_manager/instagram/presentation/pages/authenticate_page.dart';
import 'package:instagram_challenge_manager/routing/not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

// private navigators
final _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');

enum AppRoute {
  login,
  authenticate,
  home,
  challengeDetails,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final path = state.uri.path;
      final isLoggedIn = ref.read(currentUserProvider) != null;

      // Redirect to home page if navigating to login pages while logged in
      if (isLoggedIn) {
        if (path.startsWith('/login') || path.startsWith('/authenticate')) {
          return '/';
        }
      }

      // Redirect to login page if navigating to protected pages while not logged in
      if (!isLoggedIn) {
        if (path.startsWith('/login') || path.startsWith('/authenticate')) {
          return null;
        } else {
          return '/login';
        }
      }

      // No redirect
      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: SizedBox.shrink());
        },
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: '/authenticate',
        name: AppRoute.authenticate.name,
        pageBuilder: (context, state) {
          final uri = state.uri;
          return NoTransitionPage(
            child: AuthenticatePage(uri: uri),
          );
        },
      ),
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomePage(),
        ),
        routes: [
          GoRoute(
            path: ':challengeId',
            name: AppRoute.challengeDetails.name,
            pageBuilder: (context, state) {
              final challengeId = state.pathParameters['challengeId'];
              if (challengeId == null) {
                return const NoTransitionPage(
                  child: NotFoundScreen(),
                );
              }
              return NoTransitionPage(
                child: ChallengeDetailsPage(
                  challengeId: challengeId,
                ),
              );
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}

extension GoRouterExtension on GoRouter {
  // Clear the stack and navigate to a new location
  void clearStackAndNavigate(String location) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location);
  }
}
