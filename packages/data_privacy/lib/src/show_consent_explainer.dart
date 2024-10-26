import 'dart:developer';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:data_privacy/src/data_privacy_choices.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// {@template consent_explainer_config}
/// Configuration for the consent explainer dialog.
/// {@endtemplate}
class ConsentExplainerConfig {
  /// {@macro consent_explainer_config}
  const ConsentExplainerConfig({
    required this.privacyPolicyUrl,
    required this.title,
    required this.content,
    required this.acceptButtonText,
    required this.declineButtonText,
    required this.continueButtonText,
  });

  /// The URL to the privacy policy.
  final Uri privacyPolicyUrl;

  /// The title of the dialog. Displayed at the top.
  final String title;

  /// The main content of the dialog.
  final Widget content;

  /// The text for the accept button.
  final String acceptButtonText;

  /// The text for the decline button.
  final String declineButtonText;

  /// The text for the continue button.
  final String continueButtonText;
}

/// Shows a dialog explaining the data privacy settings.
/// If the platform is iOS, this method will also show the iOS App Tracking Transparency dialog.
/// If the platform is not iOS, the explanation will also include the option to enable/disable tracking.
/// This could throw, so make sure to catch any exceptions.
Future<DataPrivacySettings?> showConsentExplainer(
  BuildContext context,
  ConsentExplainerConfig consentExplainerConfig,
) async {
  final platform = defaultTargetPlatform;
  final choice = await showAdaptiveDialog<DataPrivacySettings?>(
    routeSettings: const RouteSettings(name: 'showConsentExplainer'),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(consentExplainerConfig.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            consentExplainerConfig.content,
            GestureDetector(
              onTap: () async {
                try {
                  await launchUrl(consentExplainerConfig.privacyPolicyUrl);
                } catch (e, st) {
                  log(
                    'Failed to launch URL: ${consentExplainerConfig.privacyPolicyUrl}',
                    error: e,
                    stackTrace: st,
                  );
                }
              },
              child: const Text(
                'Read our privacy policy',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        actions: [
          // If iOS, only show the continue button.
          if (platform == TargetPlatform.iOS)
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(consentExplainerConfig.continueButtonText),
            ),
          // Else, show the decline and accept buttons.
          if (platform != TargetPlatform.iOS) ...[
            TextButton(
              onPressed: () => Navigator.of(context).pop(DataPrivacySettings.basic()),
              child: Text(consentExplainerConfig.acceptButtonText),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(DataPrivacySettings.none()),
              child: Text(consentExplainerConfig.declineButtonText),
            ),
          ],
        ],
      );
    },
  );

  if (defaultTargetPlatform == TargetPlatform.iOS) {
    // Wait for the dialog to close before showing the iOS App Tracking Transparency dialog.
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return showIosAppTrackingTransparency();
  } else {
    return choice;
  }
}

/// Shows the native iOS App Tracking Transparency dialog.
Future<DataPrivacySettings> showIosAppTrackingTransparency() async {
  assert(defaultTargetPlatform == TargetPlatform.iOS, 'This method is only available on iOS');
  if (await AppTrackingTransparency.trackingAuthorizationStatus == TrackingStatus.notDetermined) {
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
    switch (status) {
      case TrackingStatus.authorized:
        final deviceAdId = await AppTrackingTransparency.getAdvertisingIdentifier();
        return DataPrivacySettings.basic(deviceAdId: deviceAdId);
      case _:
        return DataPrivacySettings.none();
    }
  } else {
    return DataPrivacySettings.none();
  }
}
