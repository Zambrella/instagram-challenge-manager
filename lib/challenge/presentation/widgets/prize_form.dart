import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:instagram_challenge_manager/challenge/domain/prize.dart';
import 'package:instagram_challenge_manager/challenge/presentation/controllers/challenge_form_state_controller.dart';
import 'package:instagram_challenge_manager/common/common.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:toastification/toastification.dart';
import 'package:uuid/uuid.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class PrizeForm extends ConsumerStatefulWidget {
  const PrizeForm({
    required this.bottomSheetContext,
    super.key,
  });

  final BuildContext bottomSheetContext;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrizeFormState();
}

class _PrizeFormState extends ConsumerState<PrizeForm> {
  final formKey = GlobalKey<FormBuilderState>();
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
      key: isOffstage ? null : formKey,
      child: SliverList.list(
        children: [
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderTextField(
            name: 'Name',
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'The name of the prize',
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
            name: 'Quantity',
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quantity',
              hintText: 'The quantity of the prize',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.integer(),
                FormBuilderValidators.min(1),
              ],
            ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          FormBuilderTextField(
            name: 'Sponsor',
            decoration: const InputDecoration(
              labelText: 'Sponsor',
              hintText: '(Optional) Who is sponsoring the prize',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.maxLength(
                  128,
                  checkNullOrEmpty: false,
                ),
              ],
            ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          OutlinedButton(
            onPressed: () {
              if (formKey.currentState!.saveAndValidate()) {
                final formData = formKey.currentState!.value;
                final prize = Prize(
                  id: const Uuid().v4(),
                  name: formData['Name'] as String,
                  quantity: int.parse(formData['Quantity'] as String),
                  sponsor: formData['Sponsor'] as String?,
                );
                ref
                    .read(challengeFormStateControllerProvider.notifier)
                    .addPrize(prize);
                toastification.showSuccess(
                  context: context,
                  message: 'Prize added',
                );
                formKey.currentState!.reset();
              }
            },
            child: const Text('Add prize'),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.saveAndValidate()) {
                final formData = formKey.currentState!.value;
                final prize = Prize(
                  id: const Uuid().v4(),
                  name: formData['Name'] as String,
                  quantity: int.parse(formData['Quantity'] as String),
                  sponsor: formData['Sponsor'] as String?,
                );
                ref
                    .read(challengeFormStateControllerProvider.notifier)
                    .addPrize(prize);
                WoltModalSheet.of(widget.bottomSheetContext)
                    .showPageWithId('create_challenge');
              }
            },
            child: const Text('Add prize and go back'),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
        ],
      ),
    );
  }
}
