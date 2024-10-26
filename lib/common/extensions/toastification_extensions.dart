import 'package:flutter/material.dart';
import 'package:flutter_starter_template/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter_starter_template/theme/theme.dart';
import 'package:toastification/toastification.dart';

extension ToastificationX on Toastification {
  ToastificationItem showSuccess({
    required BuildContext context,
    required String message,
  }) {
    final loc = AppLocalizations.of(context);
    return show(
      context: context,
      title: Text(
        loc.success,
        style: context.theme.textTheme.titleMedium!.copyWith(
          color: context.theme.semanticColors.success,
        ),
      ),
      description: Text(
        message,
        style: context.theme.textTheme.bodyMedium!.copyWith(
          color: context.theme.semanticColors.success,
        ),
      ),
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      primaryColor: context.theme.semanticColors.success,
      backgroundColor: context.theme.colorScheme.surfaceContainer,
      foregroundColor: context.theme.semanticColors.success,
      autoCloseDuration: const Duration(seconds: 5),
      borderRadius: BorderRadius.circular(context.theme.appRadius.medium),
      progressBarTheme: ProgressIndicatorThemeData(
        color: context.theme.semanticColors.success,
        linearTrackColor: context.theme.semanticColors.success.withOpacity(0.2),
        linearMinHeight: 2,
      ),
      closeOnClick: true,
      pauseOnHover: true,
      dismissDirection: DismissDirection.vertical,
    );
  }

  ToastificationItem showWarning({
    required BuildContext context,
    required String message,
  }) {
    final loc = AppLocalizations.of(context);
    return show(
      context: context,
      title: Text(
        loc.warning,
        style: context.theme.textTheme.titleMedium!.copyWith(
          color: context.theme.semanticColors.warning,
        ),
      ),
      description: Text(
        message,
        style: context.theme.textTheme.bodyMedium!.copyWith(
          color: context.theme.semanticColors.warning,
        ),
      ),
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      primaryColor: context.theme.semanticColors.warning,
      backgroundColor: context.theme.colorScheme.surfaceContainer,
      foregroundColor: context.theme.semanticColors.warning,
      autoCloseDuration: const Duration(seconds: 5),
      borderRadius: BorderRadius.circular(context.theme.appRadius.medium),
      progressBarTheme: ProgressIndicatorThemeData(
        color: context.theme.semanticColors.warning,
        linearTrackColor: context.theme.semanticColors.warning.withOpacity(0.2),
        linearMinHeight: 2,
      ),
      closeOnClick: true,
      pauseOnHover: true,
      dismissDirection: DismissDirection.vertical,
    );
  }

  ToastificationItem showError({
    required BuildContext context,
    required String message,
  }) {
    final loc = AppLocalizations.of(context);
    return show(
      context: context,
      title: Text(
        loc.error,
        style: context.theme.textTheme.titleMedium!.copyWith(
          color: context.theme.semanticColors.error,
        ),
      ),
      description: Text(
        message,
        style: context.theme.textTheme.bodyMedium!.copyWith(
          color: context.theme.semanticColors.error,
        ),
      ),
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      primaryColor: context.theme.semanticColors.error,
      backgroundColor: context.theme.colorScheme.surfaceContainer,
      foregroundColor: context.theme.semanticColors.error,
      borderRadius: BorderRadius.circular(context.theme.appRadius.medium),
      progressBarTheme: ProgressIndicatorThemeData(
        color: context.theme.semanticColors.error,
        linearTrackColor: context.theme.semanticColors.error.withOpacity(0.2),
        linearMinHeight: 2,
      ),
      closeOnClick: true,
      pauseOnHover: true,
      dismissDirection: DismissDirection.vertical,
      showProgressBar: false,
    );
  }
}
