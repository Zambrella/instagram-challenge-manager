import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        Text('Prize form'),
      ],
    );
  }
}
