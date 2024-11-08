import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_info.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramLoginWidget extends ConsumerStatefulWidget {
  const InstagramLoginWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InstagramLoginWidgetState();
}

class _InstagramLoginWidgetState extends ConsumerState<InstagramLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await launchUrl(
          InstagramInfo.initialUrl,
          webOnlyWindowName: '_self',
        );
      },
      child: Text('Login to Instagram on Web'),
    );
  }
}
