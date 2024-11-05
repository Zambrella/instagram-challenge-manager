import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:instagram_challenge_manager/app_exception.dart';
import 'package:instagram_challenge_manager/challenge/domain/account.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/hashtag.dart';
import 'package:instagram_challenge_manager/challenge/presentation/controllers/create_new_challenge_controller.dart';
import 'package:instagram_challenge_manager/home/presentation/controllers/selected_post_controller.dart';
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

  List<String> hashtags = [];
  List<String> accounts = [];

  late final TextEditingController _hashtagController;
  late final TextEditingController _accountController;

  @override
  void initState() {
    super.initState();
    checkVisibilityInitially();
    if (!isNewChallenge) {
      hashtags.addAll(challenge!.hashtags.map((e) => e.value));
      accounts.addAll(challenge!.accounts.map((e) => e.value));
    }
    _hashtagController = TextEditingController();
    _accountController = TextEditingController();
    _hashtagController.addListener(_handleHashtagInput);
    _accountController.addListener(_handleAccountInput);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedPost = ref.read(selectedPostControllerProvider);
      if (selectedPost != null) {
        hashtags.addAll(selectedPost.hashtags);
        accounts.add(selectedPost.owner.toString());
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

    if (value.isNotEmpty && !hashtags.contains(value)) {
      if (value.startsWith('#')) {
        value = value.substring(1);
      }
      if (value.endsWith(',')) {
        value = value.substring(0, value.length - 1);
        setState(() {
          hashtags.add(value);
        });
        _hashtagController.clear();
      }
    }
  }

  void _handleAccountInput() {
    var value = _accountController.text;

    if (value.isNotEmpty && !accounts.contains(value)) {
      if (value.startsWith('@')) {
        value = value.substring(1);
      }
      if (value.endsWith(',')) {
        value = value.substring(0, value.length - 1);
        setState(() {
          accounts.add(value);
        });
        _accountController.clear();
      }
    }
  }

  void _onHashtagSubmit() {
    var value = _hashtagController.text;
    if (value.isNotEmpty && !hashtags.contains(value)) {
      if (value.startsWith('#')) {
        value = value.substring(1);
      }
      setState(() {
        hashtags.add(value);
      });
      _hashtagController.clear();
    }
  }

  void _onAccountSubmit() {
    var value = _accountController.text;
    if (value.isNotEmpty && !accounts.contains(value)) {
      if (value.startsWith('@')) {
        value = value.substring(1);
      }
      setState(() {
        accounts.add(value);
      });
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
        Navigator.of(widget.bottomSheetContext).pop();
      }
    });

    final isOffstageFromBuildCheck =
        context.findAncestorWidgetOfExactType<Offstage>()?.offstage ?? true;
    final isOffstage = isOffstageFromDelayedCheck && isOffstageFromBuildCheck;
    final selectedPost = ref.watch(selectedPostControllerProvider);
    return FormBuilder(
      key: isOffstage ? null : formKey,
      child: SliverList.list(
        children: [
          if (selectedPost != null)
            InstagramPostWidget(
              post: selectedPost,
              onPostTap: () {},
            ),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderTextField(
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
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderTextField(
            name: 'description',
            maxLines: null,
            initialValue:
                isNewChallenge ? selectedPost?.caption : challenge?.description,
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
            initialValue: challenge?.hashtagsRequired,
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
          const Divider(),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderDropdown<bool>(
            name: 'accountsRequired',
            initialValue: challenge?.accountMentionRequired,
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
            controller: _accountController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            onSubmitted: (_) {
              _onAccountSubmit();
            },
            onEditingComplete: _onAccountSubmit,
            decoration: const InputDecoration(
              labelText: 'Accounts',
              hintText: 'Enter the accounts separated by commas',
            ),
            validator: FormBuilderValidators.compose(
              [],
            ),
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
          TextButton(
            onPressed: () {
              WoltModalSheet.of(context).showPageWithId('create_prize');
            },
            child: const Text('Create prize'),
          ),
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

                        if (isNewChallenge) {
                          final newChallenge = Challenge(
                            id: challenge?.id ?? const Uuid().v4(),
                            title: formData['title'] as String,
                            description: formData['description'] as String,
                            hashtagsRequired:
                                formData['hashtagsRequired'] as bool,
                            accountMentionRequired:
                                formData['accountsRequired'] as bool,
                            hashtags: hashtags.map(Hashtag.new).toList(),
                            accounts: accounts.map(Account.new).toList(),
                            startDate: formData['startDate'] as DateTime,
                            endDate: formData['endDate'] as DateTime,
                            postId: selectedPost?.id,
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
                            hashtagsRequired:
                                formData['hashtagsRequired'] as bool,
                            accountMentionRequired:
                                formData['accountsRequired'] as bool,
                            hashtags: hashtags.map(Hashtag.new).toList(),
                            accounts: accounts.map(Account.new).toList(),
                            startDate: formData['startDate'] as DateTime,
                            endDate: formData['endDate'] as DateTime,
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
