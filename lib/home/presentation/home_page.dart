import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_challenge_manager/app_exception.dart';
import 'package:instagram_challenge_manager/authentication/presentation/controllers/logout_controller.dart';
import 'package:instagram_challenge_manager/common/common.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/instagram/providers/recent_user_instagram_posts.dart';
import 'package:instagram_challenge_manager/routing/app_router.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:intl/intl.dart';
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
            pageListBuilder: (bottomSheetContext) {
              return [
                SliverWoltModalSheetPage(
                  id: 'create_challenge',
                  pageTitle: Padding(
                    padding: EdgeInsets.all(context.theme.appSpacing.medium),
                    child: Text(
                      'Create a Challenge',
                      style: context.theme.textTheme.titleLarge,
                    ),
                  ),
                  topBarTitle: Text(
                    'Create a Challenge',
                    style: context.theme.textTheme.titleMedium,
                  ),
                  trailingNavBarWidget: IconButton(
                    icon: const Icon(Icons.close),
                    tooltip: 'Close',
                    onPressed: () {
                      Navigator.of(bottomSheetContext).pop();
                    },
                  ),
                  stickyActionBar: Padding(
                    padding: EdgeInsets.all(context.theme.appSpacing.medium),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          formKey.currentState?.saveAndValidate();
                          debugPrint(formKey.currentState?.value.toString());
                        },
                        child: const Text('Create'),
                      ),
                    ),
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
                ),
                SliverWoltModalSheetPage(
                  id: 'select_post',
                  pageTitle: Padding(
                    padding: EdgeInsets.all(context.theme.appSpacing.medium),
                    child: Text(
                      'Select a Post',
                      style: context.theme.textTheme.titleLarge,
                    ),
                  ),
                  topBarTitle: Text(
                    'Select a Post',
                    style: context.theme.textTheme.titleMedium,
                  ),
                  leadingNavBarWidget: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    tooltip: 'Back',
                    onPressed: () {
                      WoltModalSheet.of(bottomSheetContext).showPrevious();
                    },
                  ),
                  trailingNavBarWidget: IconButton(
                    icon: const Icon(Icons.close),
                    tooltip: 'Close',
                    onPressed: () {
                      Navigator.of(bottomSheetContext).pop();
                    },
                  ),
                  mainContentSliversBuilder: (context) => [
                    Consumer(
                      builder: (context, ref, _) {
                        return SliverPadding(
                          padding:
                              EdgeInsets.all(context.theme.appSpacing.medium),
                          sliver: ref
                              .watch(recentUserInstagramPostsProvider)
                              .when(
                                data: (posts) {
                                  return SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        final post = posts[index];
                                        return ListTile(
                                          title: Text(post.caption),
                                          subtitle: Text(
                                            DateFormat.yMMMd()
                                                .format(post.timestamp),
                                          ),
                                          onTap: () {
                                            Navigator.of(bottomSheetContext)
                                                .pop();
                                          },
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
                          // sliver: switch (
                          //     ref.watch(recentUserInstagramPostsProvider)) {
                          //   AsyncData<List<InstagramPost>>(
                          //     valueOrNull: final posts?
                          //   ) =>
                          //     SliverList(
                          //       delegate: SliverChildBuilderDelegate(
                          //         (context, index) {
                          //           final post = posts[index];
                          //           return ListTile(
                          //             title: Text(post.caption),
                          //             subtitle: Text(
                          //               DateFormat.yMMMd().format(post.timestamp),
                          //             ),
                          //             onTap: () {
                          //               Navigator.of(bottomSheetContext).pop();
                          //             },
                          //           );
                          //         },
                          //         childCount: posts.length,
                          //       ),
                          //     ),
                          //   AsyncError<List<InstagramPost>>(:final error) =>
                          //     SliverFillRemaining(
                          //       child: Center(
                          //         child: Text(error.errorMessage(context)),
                          //       ),
                          //     ),
                          //   _ => const SliverFillRemaining(
                          //       child: Center(
                          //         child: CircularProgressIndicator(),
                          //       ),
                          //     ),
                          // },
                        );
                      },
                    ),
                  ],
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

class NewChallengeForm extends ConsumerStatefulWidget {
  const NewChallengeForm({
    required this.bottomSheetContext,
    required this.formKey,
    super.key,
  });

  final BuildContext bottomSheetContext;
  final GlobalKey<FormBuilderState> formKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewChallengeFormState();
}

class _NewChallengeFormState extends ConsumerState<NewChallengeForm> {
  // Work-around to https://github.com/woltapp/wolt_modal_sheet/issues/112
  bool isOffstageFromDelayedCheck = true;

  @override
  void initState() {
    super.initState();
    checkVisibilityInitially();
  }

  void checkVisibilityInitially() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (!mounted) return;

      setState(() {
        isOffstageFromDelayedCheck =
            context.findAncestorWidgetOfExactType<Offstage>()?.offstage ??
                false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isOffstageFromBuildCheck =
        context.findAncestorWidgetOfExactType<Offstage>()?.offstage ?? true;
    final isOffstage = isOffstageFromDelayedCheck && isOffstageFromBuildCheck;
    return FormBuilder(
      key: isOffstage ? null : widget.formKey,
      child: SliverList.list(
        children: [
          // TODO: Create a provider to hold the selected post id.
          ElevatedButton(
            onPressed: () {
              // Navigate to next page where the user can select a post
              WoltModalSheet.of(widget.bottomSheetContext).showNext();
            },
            child: Text('Select post'),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderTextField(
            name: 'title',
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Enter the title of the challenge',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(3),
                FormBuilderValidators.maxLength(128),
              ],
            ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderTextField(
            name: 'description',
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Enter the description of the challenge',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
              ],
            ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          const Divider(),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderDropdown<bool>(
            name: 'hashtagsRequired',
            decoration: const InputDecoration(
              labelText: 'Hashtags Required',
              hintText: '',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
              ],
            ),
            items: const [
              DropdownMenuItem(
                value: true,
                child: Text('Yes'),
              ),
              DropdownMenuItem(
                value: false,
                child: Text('No'),
              ),
            ],
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderTextField(
            name: 'hashtags',
            decoration: const InputDecoration(
              labelText: 'Hashtags',
              hintText: 'Enter the hashtags separated by commas',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
              ],
            ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          const Divider(),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderDropdown<bool>(
            name: 'accountsRequired',
            decoration: const InputDecoration(
              labelText: 'Accounts Required',
              hintText: '',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
              ],
            ),
            items: const [
              DropdownMenuItem(
                value: true,
                child: Text('Yes'),
              ),
              DropdownMenuItem(
                value: false,
                child: Text('No'),
              ),
            ],
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderTextField(
            name: 'accounts',
            decoration: const InputDecoration(
              labelText: 'Hosts',
              hintText: '',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
              ],
            ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          const Divider(),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderDateTimePicker(
            inputType: InputType.date,
            name: 'endDate',
            format: DateFormat.yMMMd(),
            decoration: const InputDecoration(
              labelText: 'Close Date',
              hintText: '',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
              ],
            ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          const Divider(),
          SizedBox(height: context.theme.appSpacing.medium),
          // TODO: Navigate to prizes page where new ones can be created.
          FormBuilderTextField(
            name: 'prizes',
            decoration: const InputDecoration(
              labelText: 'Prizes',
              hintText: '',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
              ],
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
