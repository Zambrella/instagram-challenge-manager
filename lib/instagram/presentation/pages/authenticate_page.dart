import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_challenge_manager/app_exception.dart';
import 'package:instagram_challenge_manager/common/common.dart';
import 'package:instagram_challenge_manager/instagram/presentation/controllers/instagram_login_controller.dart';
import 'package:instagram_challenge_manager/routing/app_router.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:toastification/toastification.dart';

class AuthenticatePage extends ConsumerStatefulWidget {
  const AuthenticatePage({
    required this.uri,
    super.key,
  });

  final Uri uri;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticatePageState();
}

class _AuthenticatePageState extends ConsumerState<AuthenticatePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(instagramLoginControllerProvider.notifier)
          .validateCodeAndLogin(widget.uri.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      instagramLoginControllerProvider,
      (prev, state) {
        // On success
        if (prev != null && prev is AsyncLoading && state is AsyncData) {
          // Pop the wolt modal.
          Navigator.of(context).pop();
          // Navigate to home page with delay so that the auth changes have time to propagate.
          Future.delayed(const Duration(milliseconds: 500), () {
            if (context.mounted) {
              context.pushReplacementNamed(AppRoute.home.name);
            }
          });
        }
        if (state is AsyncError) {
          Navigator.of(context).pop();
          toastification.showError(
            context: context,
            message: state.error.errorMessage(context),
          );
        }
      },
    );

    return Scaffold(
      body: Center(
        child: ref.watch(instagramLoginControllerProvider).maybeWhen(
              loading: () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  SizedBox(height: context.theme.appSpacing.small),
                  Text(
                    'Validating...',
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              error: (error, _) => Text(error.errorMessage(context)),
              orElse: () => ElevatedButton(
                onPressed: () async {},
                child: const Text('Login to Instagram on Web'),
              ),
            ),
      ),
    );
  }
}
