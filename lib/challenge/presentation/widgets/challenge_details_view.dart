import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:intl/intl.dart';

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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.theme.appSpacing.large,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: context.theme.appSpacing.small),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.info_outline),
                        SizedBox(width: context.theme.appSpacing.small),
                        Text(
                          'Challenge Info',
                          style: context.theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                    Text(
                      'Title',
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      challenge.title,
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                    Text(
                      'Description',
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      challenge.description,
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                    Text(
                      'Hashtags',
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.theme.appSpacing.small),
                    Wrap(
                      spacing: context.theme.appSpacing.small,
                      runSpacing: context.theme.appSpacing.small,
                      children: challenge.hashtags.map((hashtag) {
                        return Chip(
                          label: Text(hashtag.withHash),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                    Text(
                      'Accounts',
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.theme.appSpacing.small),
                    Wrap(
                      spacing: context.theme.appSpacing.small,
                      runSpacing: context.theme.appSpacing.small,
                      children: challenge.accounts.map((account) {
                        return Chip(
                          label: Text(account.withAtSign),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                    Text(
                      'Dates',
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${DateFormat.yMMMd().format(challenge.startDate)} - ${DateFormat.yMMMd().format(challenge.endDate)}',
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                    Text(
                      'Prizes',
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      challenge.prizes.toString(),
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.theme.appSpacing.small),
            child: const VerticalDivider(),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.theme.appSpacing.large,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.confirmation_num_outlined),
                        SizedBox(width: context.theme.appSpacing.small),
                        Text(
                          'Entries',
                          style: context.theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                    ...Iterable.generate(20, (i) => i).map(
                      (i) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(i.toString()),
                          ),
                          title: Text('User $i'),
                          subtitle: Text('Entry $i'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.check),
                                tooltip: 'Approve',
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                tooltip: 'Reject',
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
