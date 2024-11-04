import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/entry_status.dart';
import 'package:instagram_challenge_manager/theme/theme_extensions.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ChallengePinnedHeader extends ConsumerWidget {
  const ChallengePinnedHeader({
    required this.status,
    super.key,
  });

  final EntryStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPinnedHeader(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.theme.appSpacing.small,
        ),
        child: Row(
          children: [
            Icon(
              switch (status) {
                EntryStatus.pending => Icons.pause,
                EntryStatus.valid => Icons.check,
                EntryStatus.invalid => Icons.close,
              },
            ),
            SizedBox(width: context.theme.appSpacing.small),
            Text(
              status.name,
              style: context.theme.textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
