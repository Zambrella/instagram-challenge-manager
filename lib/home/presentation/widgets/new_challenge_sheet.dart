import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/app_exception.dart';
import 'package:instagram_challenge_manager/home/presentation/controllers/selected_post_controller.dart';
import 'package:instagram_challenge_manager/home/presentation/widgets/new_challenge_form.dart';
import 'package:instagram_challenge_manager/instagram/presentation/widgets/instagram_post_widget.dart';
import 'package:instagram_challenge_manager/instagram/providers/recent_user_instagram_posts.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class NewChallengeSheet {
  static SliverWoltModalSheetPage form({
    required BuildContext bottomSheetContext,
    required GlobalKey<FormBuilderState> formKey,
    required VoidCallback onClose,
  }) {
    return SliverWoltModalSheetPage(
      id: 'create_challenge',
      pageTitle: Padding(
        padding: EdgeInsets.all(bottomSheetContext.theme.appSpacing.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a Challenge',
              style: bottomSheetContext.theme.textTheme.titleLarge,
            ),
            Text(
              'Fill in the information below to create a new challenge.',
              style: bottomSheetContext.theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      topBarTitle: Text(
        'Create a Challenge',
        style: bottomSheetContext.theme.textTheme.titleMedium,
      ),
      trailingNavBarWidget: IconButton(
        icon: const Icon(Icons.close),
        tooltip: 'Close',
        onPressed: onClose,
      ),
      mainContentSliversBuilder: (context) => [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: context.theme.appSpacing.medium,
          ),
          sliver: NewChallengeForm(
            bottomSheetContext: bottomSheetContext,
            formKey: formKey,
          ),
        ),
      ],
    );
  }

  static SliverWoltModalSheetPage choosePost({
    required BuildContext bottomSheetContext,
    required GlobalKey<FormBuilderState> formKey,
    required VoidCallback onClose,
  }) {
    return SliverWoltModalSheetPage(
      id: 'choose_post',
      pageTitle: Padding(
        padding: EdgeInsets.all(bottomSheetContext.theme.appSpacing.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a post',
              style: bottomSheetContext.theme.textTheme.titleLarge,
            ),
            Text(
              'Optionally select one of your recent posts to create a challenge.',
              style: bottomSheetContext.theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      topBarTitle: Text(
        'Select a Post',
        style: bottomSheetContext.theme.textTheme.titleMedium,
      ),
      trailingNavBarWidget: IconButton(
        icon: const Icon(Icons.close),
        tooltip: 'Close',
        onPressed: onClose,
      ),
      stickyActionBar: Padding(
        padding: EdgeInsets.all(bottomSheetContext.theme.appSpacing.medium),
        child: SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              WoltModalSheet.of(bottomSheetContext)
                  .showPageWithId('create_challenge');
            },
            child: const Text('Skip'),
          ),
        ),
      ),
      mainContentSliversBuilder: (context) => [
        Consumer(
          builder: (context, ref, _) {
            return SliverPadding(
              padding: EdgeInsets.all(context.theme.appSpacing.medium),
              sliver: SliverPadding(
                padding: const EdgeInsets.only(bottom: 50),
                sliver: ref.watch(recentUserInstagramPostsProvider).when(
                      data: (posts) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final post = posts[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: context.theme.appSpacing.medium,
                                ),
                                child: InstagramPostWidget(
                                  post: post,
                                  onPostTap: () {
                                    ref
                                        .read(
                                          selectedPostControllerProvider
                                              .notifier,
                                        )
                                        .setSelectedPost(post);
                                    WoltModalSheet.of(context)
                                        .showPageWithId('create_challenge');
                                  },
                                ),
                              );
                            },
                            childCount: posts.length,
                          ),
                        );
                      },
                      loading: () => const SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      error: (error, _) => SliverFillRemaining(
                        child: Center(
                          child: Text(error.errorMessage(context)),
                        ),
                      ),
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}
