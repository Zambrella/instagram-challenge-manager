import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/app_dependencies.dart';
import 'package:flutter_starter_template/authentication/providers/authentication_providers.dart';
import 'package:flutter_starter_template/authentication/providers/login_provider.dart';
import 'package:flutter_starter_template/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter_starter_template/routing/app_router.dart';
import 'package:flutter_starter_template/theme/app_theme.dart';
import 'package:flutter_starter_template/theme/form_factor.dart';
import 'package:flutter_starter_template/theme/selected_theme.dart';
import 'package:flutter_starter_template/theme/text_scale_factor_clamper.dart';
import 'package:toastification/toastification.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      serviceInitialisationProvider,
      (_, state) {
        if (state.hasValue || state.hasError) {
          FlutterNativeSplash.remove();
        }
      },
    );

    final initDependencies = ref.watch(serviceInitialisationProvider);
    final goRouter = ref.watch(goRouterProvider);
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp.router(
          routerConfig: goRouter,
          theme: AppTheme.lightThemeData.copyWith(),
          darkTheme: AppTheme.darkThemeData.copyWith(),
          themeMode: ref.watch(selectedThemeProvider).maybeWhen(
                orElse: () => ThemeMode.system,
                data: (themeMode) => themeMode,
              ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            // Wrap with InheritedWidgets here if needed. E.g. One that overrides the text scale factor
            return initDependencies.when(
              skipLoadingOnRefresh: false,
              data: (_) => InitComplete(child: child!),
              // Loading screen is handled by the native splash screen on the first load.
              // If there's an error and the user refreshes, the loading screen will be shown.
              loading: () => const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (_, __) {
                // Logging the error is handled by the provider observer.
                return const AppStartupErrorWidget();
              },
            );
          },
        );
      },
    );
  }
}

class InitComplete extends ConsumerStatefulWidget {
  const InitComplete({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<InitComplete> createState() => _InitCompleteState();
}

class _InitCompleteState extends ConsumerState<InitComplete> {
  late FormFactor formFactor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    formFactor = getFormFactor(context);
  }

  /// Helper method to get form factor based on width of device
  static FormFactor getFormFactor(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    if (mediaQueryWidth <= FormFactor.mobile.breakpoint) {
      return FormFactor.mobile;
    } else if (mediaQueryWidth <= FormFactor.laptop.breakpoint) {
      return FormFactor.tablet;
    } else if (mediaQueryWidth <= FormFactor.desktop.breakpoint) {
      return FormFactor.laptop;
    } else {
      return FormFactor.desktop;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateChangesProvider, (prev, state) async {
      if (state.hasValue && state.asData?.value != null) {
        final userId = state.asData!.value!.id;
        await ref.read(loginProvider(userId).future);
      }
    });

    return TextScaleFactorClamper(
      child: ToastificationConfigProvider(
        config: const ToastificationConfig(
          alignment: Alignment.topCenter,
        ),
        child: FormFactorWidget(
          formFactor: formFactor,
          child: widget.child,
        ),
      ),
    );
  }
}

class AppStartupErrorWidget extends ConsumerWidget {
  const AppStartupErrorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Unexpected error!\nPlease restart the app.',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(appDependenciesProvider);
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
