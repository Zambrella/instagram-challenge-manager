import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/app_exception.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/prize.dart';
import 'package:instagram_challenge_manager/challenge/presentation/controllers/winners_controller.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ChallengePrizeDrawDialog extends ConsumerStatefulWidget {
  const ChallengePrizeDrawDialog({
    required this.challenge,
    super.key,
  });

  final Challenge challenge;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChallengePrizeDrawDialogState();
}

class _ChallengePrizeDrawDialogState
    extends ConsumerState<ChallengePrizeDrawDialog> {
  Challenge get challenge => widget.challenge;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      winnersControllerProvider(challenge),
      (prev, state) {},
    );

    const rowHeight = 100.0;
    final winnersController = ref.watch(winnersControllerProvider(challenge));
    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: FormFactor.mobile.breakpoint,
        ),
        child: Padding(
          padding: EdgeInsets.all(context.theme.appSpacing.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Challenge Winners',
                style: context.theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.theme.appSpacing.medium,
              ),
              winnersController.when(
                data: (winners) {
                  if (winners.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.all(context.theme.appSpacing.medium),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('No winners yet'),
                          SizedBox(height: context.theme.appSpacing.small),
                          FilledButton(
                            onPressed: () {
                              ref
                                  .read(
                                    winnersControllerProvider(challenge)
                                        .notifier,
                                  )
                                  .drawWinners(challenge);
                            },
                            child: const Text('Draw winners'),
                          ),
                        ],
                      ),
                    );
                  }
                  final posts = winners.keys;
                  final prizes = winners.values;
                  return Flexible(
                    child: SingleChildScrollView(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const ColumnTitle(title: 'Prize'),
                                    for (final prize in prizes) ...[
                                      PrizeCell(
                                        prize: prize,
                                        size: rowHeight,
                                      ),
                                      const Divider(),
                                    ],
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const ColumnTitle(title: 'Winner'),
                                    for (final post in posts) ...[
                                      WinnerCell(
                                        post: post,
                                        size: rowHeight,
                                      ),
                                      const Divider(),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: context.theme.appSpacing.large),
                          OutlinedButton(
                            onPressed: () {
                              ref
                                  .read(
                                    winnersControllerProvider(challenge)
                                        .notifier,
                                  )
                                  .drawWinners(challenge);
                            },
                            child: const Text('Redraw'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loading: () => Center(
                  child: Padding(
                    padding: EdgeInsets.all(
                      context.theme.appSpacing.medium,
                    ),
                    child: const CircularProgressIndicator(),
                  ),
                ),
                error: (error, _) => Padding(
                  padding: EdgeInsets.all(
                    context.theme.appSpacing.medium,
                  ),
                  child: Text(
                    error.errorMessage(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnTitle extends ConsumerWidget {
  const ColumnTitle({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      title,
      style: context.theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
    );
  }
}

class PrizeCell extends ConsumerWidget {
  const PrizeCell({
    required this.size,
    required this.prize,
    super.key,
  });

  final double size;
  final Prize prize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: size,
      child: Center(
        child: Text(prize.name),
      ),
    );
  }
}

class WinnerCell extends ConsumerWidget {
  const WinnerCell({
    required this.size,
    required this.post,
    super.key,
  });

  final double size;
  final InstagramPost post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: size,
      child: InkWell(
        onTap: () async {
          await launchUrl(post.permalink);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(post.owner.withAtSign),
            Flexible(
              child: Ink.image(
                image: NetworkImage(
                  post.mediaUrl.toString(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
