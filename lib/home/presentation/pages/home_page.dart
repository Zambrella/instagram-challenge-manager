import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_challenge_manager/app_exception.dart';
import 'package:instagram_challenge_manager/authentication/presentation/controllers/logout_controller.dart';
import 'package:instagram_challenge_manager/common/common.dart';
import 'package:instagram_challenge_manager/home/presentation/controllers/selected_post_controller.dart';
import 'package:instagram_challenge_manager/home/presentation/widgets/new_challenge_sheet.dart';
import 'package:instagram_challenge_manager/routing/app_router.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:toastification/toastification.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  void onClose() {
    ref.invalidate(selectedPostControllerProvider);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(logoutControllerProvider, (prev, next) {
      if (next is AsyncData) {
        GoRouter.of(context).clearStackAndNavigate('/login');
      }

      if (next is AsyncError) {
        toastification.showError(
          context: context,
          message: next.error.errorMessage(context),
        );
      }

      if (next is AsyncLoading) {
        // print('Loading...');
      }
    });

    final theme = ref.watch(selectedThemeProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Challenges'),
        leading: Padding(
          padding: EdgeInsets.all(context.theme.appSpacing.small),
          child: CircleAvatar(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              ref.read(logoutControllerProvider.notifier).logout();
            },
          ),
          if (theme != null)
            IconButton(
              icon: Icon(
                switch (theme) {
                  ThemeMode.system => Icons.brightness_auto,
                  ThemeMode.light => Icons.brightness_high,
                  ThemeMode.dark => Icons.brightness_3,
                },
              ),
              tooltip: 'Toggle theme',
              onPressed: () {
                ref.read(selectedThemeProvider.notifier).setThemeMode(
                      switch (theme) {
                        ThemeMode.system => ThemeMode.light,
                        ThemeMode.light => ThemeMode.dark,
                        ThemeMode.dark => ThemeMode.system,
                      },
                    );
              },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await WoltModalSheet.show<void>(
            context: context,
            onModalDismissedWithDrag: onClose,
            onModalDismissedWithBarrierTap: onClose,
            pageListBuilder: (bottomSheetContext) {
              return [
                NewChallengeSheet.choosePost(
                  bottomSheetContext: bottomSheetContext,
                  formKey: formKey,
                  onClose: onClose,
                ),
                NewChallengeSheet.form(
                  bottomSheetContext: bottomSheetContext,
                  formKey: formKey,
                  onClose: onClose,
                ),
              ];
            },
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Create a challenge'),
      ),
      body: Container(),
    );
  }
}
