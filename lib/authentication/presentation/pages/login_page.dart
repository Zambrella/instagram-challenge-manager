import 'package:flutter/material.dart';
import 'package:instagram_challenge_manager/instagram/presentation/widgets/instagram_login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InstagramLoginWidget(),
          ],
        ),
      ),
    );
  }
}
