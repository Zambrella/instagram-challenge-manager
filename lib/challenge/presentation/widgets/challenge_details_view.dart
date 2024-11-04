import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/presentation/widgets/challenge_entry_list.dart';
import 'package:instagram_challenge_manager/challenge/presentation/widgets/challenge_info.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';

class ChallengeDetailsView extends ConsumerStatefulWidget {
  const ChallengeDetailsView({
    required this.challenge,
    super.key,
  });

  final Challenge challenge;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChallengeDetailsViewState();
}

class _ChallengeDetailsViewState extends ConsumerState<ChallengeDetailsView> {
  Challenge get challenge => widget.challenge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(challenge.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.shuffle),
        label: const Text('Draw winners'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ChallengeInfo(
              challenge: challenge,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.theme.appSpacing.small),
            child: const VerticalDivider(),
          ),
          Expanded(
            flex: 2,
            child: ChallengeEntryList(
              challenge: challenge,
            ),
          ),
        ],
      ),
    );
  }
}
