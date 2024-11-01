import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:instagram_challenge_manager/home/presentation/controllers/selected_post_controller.dart';
import 'package:instagram_challenge_manager/instagram/presentation/widgets/instagram_post_widget.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

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
    final selectedPost = ref.watch(selectedPostControllerProvider);
    return FormBuilder(
      key: isOffstage ? null : widget.formKey,
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
            initialValue: selectedPost?.caption,
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
            initialValue: selectedPost?.hashtags.join(', '),
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
          // TODO: Fill in with the post owner's account
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
            name: 'startDate',
            initialValue: selectedPost?.timestamp,
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
