import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:instagram_challenge_manager/app_exception.dart';
import 'package:instagram_challenge_manager/challenge/domain/account.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/hashtag.dart';
import 'package:instagram_challenge_manager/challenge/presentation/controllers/challenge_form_state_controller.dart';
import 'package:instagram_challenge_manager/challenge/presentation/controllers/create_new_challenge_controller.dart';
import 'package:instagram_challenge_manager/challenge/presentation/controllers/selected_post_controller.dart';
import 'package:instagram_challenge_manager/instagram/presentation/widgets/instagram_post_widget.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ChallengeForm extends ConsumerStatefulWidget {
  const ChallengeForm({
    required this.bottomSheetContext,
    this.challenge,
    super.key,
  });

  /// The context of the bottom sheet.
  /// This is used to navigate the form.
  final BuildContext bottomSheetContext;

  /// Optional: The existing challenge to edit.
  final Challenge? challenge;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChallengeFormState();
}

class _ChallengeFormState extends ConsumerState<ChallengeForm> {
  final formKey = GlobalKey<FormBuilderState>();
  Challenge? get challenge => widget.challenge;
  late final isNewChallenge = widget.challenge == null;

  // Work-around to https://github.com/woltapp/wolt_modal_sheet/issues/112
  bool isOffstageFromDelayedCheck = true;

  late final TextEditingController _hashtagController;
  late final TextEditingController _accountController;

  @override
  void initState() {
    super.initState();
    checkVisibilityInitially();

    _hashtagController = TextEditingController();
    _accountController = TextEditingController();
    _hashtagController.addListener(_handleHashtagInput);
    _accountController.addListener(_handleAccountInput);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedPost = ref.read(selectedPostControllerProvider);
      if (selectedPost != null) {
        ref.read(challengeFormStateControllerProvider.notifier)
          ..addHashtags(selectedPost.hashtags)
          ..addAccount(selectedPost.owner.toString());
      }

      if (!isNewChallenge) {
        ref.read(challengeFormStateControllerProvider.notifier)
          ..addHashtags(challenge!.hashtags.map((e) => e.value).toList())
          ..addAccounts(challenge!.accounts.map((e) => e.value).toList())
          ..addPrizes(challenge!.prizes);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _hashtagController
      ..removeListener(_handleHashtagInput)
      ..dispose();
    _accountController
      ..removeListener(_handleAccountInput)
      ..dispose();
    super.dispose();
  }

  void _handleHashtagInput() {
    var value = _hashtagController.text;

    if (value.isNotEmpty) {
      if (value.startsWith('#')) {
        value = value.substring(1);
      }
      if (value.endsWith(',')) {
        value = value.substring(0, value.length - 1);
        ref
            .read(challengeFormStateControllerProvider.notifier)
            .addHashtag(value);
        _hashtagController.clear();
      }
    }
  }

  void _handleAccountInput() {
    var value = _accountController.text;

    if (value.isNotEmpty) {
      if (value.startsWith('@')) {
        value = value.substring(1);
      }
      if (value.endsWith(',')) {
        value = value.substring(0, value.length - 1);
        ref
            .read(challengeFormStateControllerProvider.notifier)
            .addAccount(value);
        _accountController.clear();
      }
    }
  }

  void _onHashtagSubmit() {
    var value = _hashtagController.text;
    if (value.isNotEmpty) {
      if (value.startsWith('#')) {
        value = value.substring(1);
      }
      ref.read(challengeFormStateControllerProvider.notifier).addHashtag(value);
      _hashtagController.clear();
    }
  }

  void _onAccountSubmit() {
    var value = _accountController.text;
    if (value.isNotEmpty) {
      if (value.startsWith('@')) {
        value = value.substring(1);
      }
      ref.read(challengeFormStateControllerProvider.notifier).addAccount(value);
      _accountController.clear();
    }
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
    ref.listen(createNewChallengeControllerProvider, (prev, next) {
      if (prev != null && prev is AsyncLoading && next is AsyncData) {
        ref
          ..invalidate(selectedPostControllerProvider)
          ..invalidate(challengeFormStateControllerProvider);
        Navigator.of(widget.bottomSheetContext).pop();
      }
    });

    final isOffstageFromBuildCheck =
        context.findAncestorWidgetOfExactType<Offstage>()?.offstage ?? true;
    final isOffstage = isOffstageFromDelayedCheck && isOffstageFromBuildCheck;
    final selectedPost = ref.watch(selectedPostControllerProvider);
    final hashtags = ref.watch(formHashtagsProvider);
    final accounts = ref.watch(formAccountsProvider);
    final prizes = ref.watch(formPrizesProvider);
    return FormBuilder(
      key: isOffstage ? null : formKey,
      initialValue:
          ref.watch(challengeFormStateControllerProvider).initialValues,
      child: SliverList.list(
        children: [
          if (selectedPost != null)
            InstagramPostWidget(
              post: selectedPost,
              onPostTap: () {},
            ),
          SizedBox(height: context.theme.appSpacing.medium),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'title',
                  initialValue: challenge?.title,
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
              ),
            ],
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'description',
                  maxLines: null,
                  initialValue: isNewChallenge
                      ? selectedPost?.caption
                      : challenge?.description,
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
              ),
            ],
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          const Divider(),
          SizedBox(height: context.theme.appSpacing.medium),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'hashtags',
                  controller: _hashtagController,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  onSubmitted: (_) {
                    _onHashtagSubmit();
                  },
                  onEditingComplete: _onHashtagSubmit,
                  decoration: const InputDecoration(
                    labelText: 'Hashtags',
                    hintText: 'Enter the hashtags separated by commas',
                  ),
                  validator: FormBuilderValidators.compose(
                    [],
                  ),
                ),
              ),
              Tooltip(
                message:
                    'The hashtags people should use to enter the challenge.\nAt least 1 must be provided.',
                child: Padding(
                  padding:
                      EdgeInsets.only(left: context.theme.appSpacing.small),
                  child: Icon(
                    Icons.info_outline,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          if (hashtags.isNotEmpty)
            SizedBox(height: context.theme.appSpacing.small),
          if (hashtags.isNotEmpty)
            Wrap(
              spacing: context.theme.appSpacing.small,
              runSpacing: context.theme.appSpacing.small,
              children: hashtags
                  .map(
                    (hashtag) => Chip(
                      label: Text('#$hashtag'),
                      onDeleted: () {
                        setState(() {
                          hashtags.remove(hashtag);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          SizedBox(height: context.theme.appSpacing.medium),
          // const Divider(),
          // SizedBox(height: context.theme.appSpacing.medium),
          // FormBuilderDropdown<bool>(
          //   name: 'accountsRequired',
          //   initialValue: challenge?.accountMentionRequired,
          //   decoration: const InputDecoration(
          //     labelText: 'Accounts Required',
          //     hintText: '',
          //   ),
          //   validator: FormBuilderValidators.compose(
          //     [
          //       FormBuilderValidators.required(),
          //     ],
          //   ),
          //   items: const [
          //     DropdownMenuItem(
          //       value: true,
          //       child: Text('Yes'),
          //     ),
          //     DropdownMenuItem(
          //       value: false,
          //       child: Text('No'),
          //     ),
          //   ],
          // ),
          // SizedBox(height: context.theme.appSpacing.medium),
          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'accounts',
                  controller: _accountController,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  onSubmitted: (_) {
                    _onAccountSubmit();
                  },
                  onEditingComplete: _onAccountSubmit,
                  decoration: const InputDecoration(
                    labelText: 'Hosts',
                    hintText: 'Enter the hosts separated by commas',
                  ),
                  validator: FormBuilderValidators.compose(
                    [],
                  ),
                ),
              ),
              Tooltip(
                message:
                    'The Instagram accounts that are hosting the challenge.',
                child: Padding(
                  padding:
                      EdgeInsets.only(left: context.theme.appSpacing.small),
                  child: Icon(
                    Icons.info_outline,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          if (accounts.isNotEmpty)
            SizedBox(height: context.theme.appSpacing.small),
          if (accounts.isNotEmpty)
            Wrap(
              spacing: context.theme.appSpacing.small,
              runSpacing: context.theme.appSpacing.small,
              children: accounts
                  .map(
                    (account) => Chip(
                      label: Text('@$account'),
                      onDeleted: () {
                        setState(() {
                          accounts.remove(account);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          SizedBox(height: context.theme.appSpacing.medium),
          const Divider(),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderDateTimePicker(
            inputType: InputType.date,
            name: 'startDate',
            initialValue:
                isNewChallenge ? selectedPost?.timestamp : challenge?.startDate,
            format: DateFormat.yMMMd(),
            decoration: const InputDecoration(
              labelText: 'Start Date',
              hintText: '',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
              ],
            ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderDateTimePicker(
            inputType: InputType.date,
            initialValue: challenge?.endDate,
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
          Wrap(
            spacing: context.theme.appSpacing.small,
            runSpacing: context.theme.appSpacing.small,
            children: prizes
                .map<Widget>(
                  (prize) => Chip(
                    label: Text(
                      '${NumberFormat().format(prize.quantity)} x ${prize.name}',
                    ),
                    onDeleted: () {
                      setState(() {
                        prizes.remove(prize);
                      });
                    },
                  ),
                )
                .toList()
              ..add(
                OutlinedButton.icon(
                  onPressed: () {
                    formKey.currentState!.save();
                    ref
                        .read(challengeFormStateControllerProvider.notifier)
                        .saveFields(formKey.currentState!.value);
                    WoltModalSheet.of(context).showPageWithId('create_prize');
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add prize'),
                ),
              ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.theme.appSpacing.medium,
            ),
            child: ref.watch(createNewChallengeControllerProvider).isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : FilledButton(
                    onPressed: () async {
                      if (formKey.currentState!.saveAndValidate()) {
                        final formData = formKey.currentState!.value;
                        if (hashtags.isEmpty) {
                          formKey.currentState?.fields['hashtags']
                              ?.invalidate('Must include at least 1 hashtag');
                        }
                        if (isNewChallenge) {
                          final newChallenge = Challenge(
                            id: challenge?.id ?? const Uuid().v4(),
                            title: formData['title'] as String,
                            description: formData['description'] as String,
                            accountMentionRequired:
                                formData['accountsRequired'] as bool,
                            hashtags: hashtags.map(Hashtag.new).toList(),
                            accounts: accounts.map(Account.new).toList(),
                            startDate: formData['startDate'] as DateTime,
                            endDate: formData['endDate'] as DateTime,
                            postId: selectedPost?.id,
                            prizes: prizes,
                          );
                          await ref
                              .read(
                                createNewChallengeControllerProvider.notifier,
                              )
                              .createNewChallenge(newChallenge);
                        } else {
                          final newChallenge = challenge!.copyWith(
                            title: formData['title'] as String,
                            description: formData['description'] as String,
                            accountMentionRequired:
                                formData['accountsRequired'] as bool,
                            hashtags: hashtags.map(Hashtag.new).toList(),
                            accounts: accounts.map(Account.new).toList(),
                            startDate: formData['startDate'] as DateTime,
                            endDate: formData['endDate'] as DateTime,
                            prizes: prizes,
                          );
                          await ref
                              .read(
                                createNewChallengeControllerProvider.notifier,
                              )
                              .updateChallenge(newChallenge);
                        }
                      }
                    },
                    child: const Text('Save'),
                  ),
          ),
          if (ref.watch(createNewChallengeControllerProvider).hasError)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.theme.appSpacing.medium,
              ),
              child: Text(
                ref
                    .watch(createNewChallengeControllerProvider)
                    .error!
                    .errorMessage(context),
                style: context.theme.textTheme.bodyMedium!.copyWith(
                  color: context.theme.colorScheme.error,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
