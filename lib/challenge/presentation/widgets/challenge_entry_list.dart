import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/entry_status.dart';
import 'package:instagram_challenge_manager/challenge/presentation/controllers/challenge_entries_controller.dart';
import 'package:instagram_challenge_manager/challenge/presentation/widgets/challenge_entry_widget.dart';
import 'package:instagram_challenge_manager/challenge/presentation/widgets/challenge_pinned_header.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ChallengeEntryList extends ConsumerStatefulWidget {
  const ChallengeEntryList({
    required this.challenge,
    super.key,
  });

  final Challenge challenge;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChallengeEntryListState();
}

class _ChallengeEntryListState extends ConsumerState<ChallengeEntryList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ref
        .watch(challengeEntriesControllerProvider(widget.challenge))
        .maybeWhen(
          data: (state) {
            final pendingEntries = state.$2.pending;
            final validEntries = state.$2.valid;
            final invalidEntries = state.$2.invalid;
            final challenge = state.$1;
            return state.$2.isEmpty
                ? const Center(
                    child: Text('No entries yet'),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        title: Row(
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
                        actions: [
                          IconButton(
                            onPressed: () {
                              ref.invalidate(
                                challengeEntriesControllerProvider(challenge),
                              );
                            },
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                      MultiSliver(
                        pushPinnedChildren: true,
                        children: [
                          const ChallengePinnedHeader(
                            status: EntryStatus.pending,
                          ),
                          if (pendingEntries.isEmpty)
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.all(
                                  context.theme.appSpacing.large,
                                ),
                                child: Center(
                                  child: Text(
                                    'No pending entries',
                                    style: context.theme.textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                          SliverPadding(
                            padding: EdgeInsets.only(
                              bottom: context.theme.appSpacing.veryLarge,
                            ),
                            sliver: SliverLayoutBuilder(
                              builder: (context, constraints) {
                                final crossAxisCount = max(
                                  1,
                                  constraints.crossAxisExtent ~/ 400,
                                );
                                return SliverClip(
                                  child: SliverGrid.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.7,
                                      crossAxisCount: crossAxisCount,
                                      crossAxisSpacing:
                                          context.theme.appSpacing.small,
                                      mainAxisSpacing:
                                          context.theme.appSpacing.small,
                                    ),
                                    itemCount: pendingEntries.length,
                                    itemBuilder: (context, index) {
                                      final entry = pendingEntries[index];
                                      return ChallengeEntryWidget(
                                        post: entry,
                                        status: EntryStatus.pending,
                                        onApprove: () async {
                                          await ref
                                              .read(
                                                challengeEntriesControllerProvider(
                                                  widget.challenge,
                                                ).notifier,
                                              )
                                              .approveEntry(
                                                entry,
                                              );
                                        },
                                        onReject: () async {
                                          await ref
                                              .read(
                                                challengeEntriesControllerProvider(
                                                  widget.challenge,
                                                ).notifier,
                                              )
                                              .rejectEntry(
                                                entry,
                                              );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      MultiSliver(
                        pushPinnedChildren: true,
                        children: [
                          const ChallengePinnedHeader(
                            status: EntryStatus.valid,
                          ),
                          if (validEntries.isEmpty)
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.all(
                                  context.theme.appSpacing.large,
                                ),
                                child: Center(
                                  child: Text(
                                    'No valid entries yet',
                                    style: context.theme.textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                          SliverPadding(
                            padding: EdgeInsets.only(
                              bottom: context.theme.appSpacing.veryLarge,
                            ),
                            sliver: SliverLayoutBuilder(
                              builder: (context, constraints) {
                                final crossAxisCount = max(
                                  1,
                                  constraints.crossAxisExtent ~/ 300,
                                );
                                return SliverClip(
                                  child: SliverGrid.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.78,
                                      crossAxisCount: crossAxisCount,
                                      crossAxisSpacing:
                                          context.theme.appSpacing.small,
                                      mainAxisSpacing:
                                          context.theme.appSpacing.small,
                                    ),
                                    itemCount: validEntries.length,
                                    itemBuilder: (context, index) {
                                      final entry = validEntries[index];
                                      return ChallengeEntryWidget(
                                        post: entry,
                                        status: EntryStatus.valid,
                                        onReject: () async {
                                          await ref
                                              .read(
                                                challengeEntriesControllerProvider(
                                                  widget.challenge,
                                                ).notifier,
                                              )
                                              .rejectEntry(
                                                entry,
                                              );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      MultiSliver(
                        pushPinnedChildren: true,
                        children: [
                          const ChallengePinnedHeader(
                            status: EntryStatus.invalid,
                          ),
                          if (invalidEntries.isEmpty)
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.all(
                                  context.theme.appSpacing.large,
                                ),
                                child: Center(
                                  child: Text(
                                    'No invalid entries yet',
                                    style: context.theme.textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                          // To make sure the FAB does not hide the content at the bottom.
                          SliverPadding(
                            padding: const EdgeInsets.only(bottom: 80),
                            sliver: SliverLayoutBuilder(
                              builder: (context, constraints) {
                                final crossAxisCount = max(
                                  1,
                                  constraints.crossAxisExtent ~/ 300,
                                );
                                return SliverClip(
                                  child: SliverGrid.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.78,
                                      crossAxisCount: crossAxisCount,
                                      crossAxisSpacing:
                                          context.theme.appSpacing.small,
                                      mainAxisSpacing:
                                          context.theme.appSpacing.small,
                                    ),
                                    itemCount: invalidEntries.length,
                                    itemBuilder: (context, index) {
                                      final entry = invalidEntries[index];
                                      return ChallengeEntryWidget(
                                        post: entry,
                                        status: EntryStatus.invalid,
                                        onApprove: () async {
                                          await ref
                                              .read(
                                                challengeEntriesControllerProvider(
                                                  widget.challenge,
                                                ).notifier,
                                              )
                                              .approveEntry(
                                                entry,
                                              );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
          },
          error: (error, _) => Text(error.toString()),
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
