import 'package:flutter/material.dart';
import 'package:instagram_challenge_manager/l10n/gen_l10n/app_localizations.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(AppLocalizations.of(context).pageNotFound),
        // TODO: Add a button to go back to the previous page (or home?)
      ),
    );
  }
}
