import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:data_privacy/data_privacy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await showConsentExplainer(
              context,
              ConsentExplainerConfig(
                privacyPolicyUrl: Uri.parse('https://google.com'),
                title: 'Privacy Consent',
                content: const Text('Your data is very important to us...'),
                acceptButtonText: 'Agree',
                declineButtonText: 'Decline',
                continueButtonText: 'Continue',
              ),
            );
            log(result.toString());
          },
          child: const Text('Show Consent Explainer'),
        ),
      ),
    );
  }
}
