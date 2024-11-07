import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/presentation/controllers/winners_controller.dart';
import 'package:instagram_challenge_manager/instagram/presentation/widgets/instagram_post_widget.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_post.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ChallengeInfo extends ConsumerStatefulWidget {
  const ChallengeInfo({
    required this.challenge,
    super.key,
  });

  final Challenge challenge;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChallengeInfoState();
}

class _ChallengeInfoState extends ConsumerState<ChallengeInfo> {
  Challenge get challenge => widget.challenge;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            ref
                .watch(
                  instagramPostProvider(challenge.postId.toString()),
                )
                .maybeWhen(
                  data: (post) => InstagramPostWidget(
                    post: post,
                    onPostTap: () async {
                      await launchUrl(post.permalink);
                    },
                  ),
                  error: (error, _) => Text(error.toString()),
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            SizedBox(height: context.theme.appSpacing.medium),
            Text(
              'Title',
              style: context.theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.onSurfaceVariant,
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
                color: context.theme.colorScheme.onSurfaceVariant,
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
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (challenge.hashtags.isEmpty)
              Text(
                'No hashtags',
                style: context.theme.textTheme.bodyLarge,
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
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (challenge.accounts.isEmpty)
              Text(
                'No accounts',
                style: context.theme.textTheme.bodyLarge,
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
                color: context.theme.colorScheme.onSurfaceVariant,
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
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (challenge.prizes.isEmpty)
              Text(
                'No prizes',
                style: context.theme.textTheme.bodyLarge,
              ),
            SizedBox(height: context.theme.appSpacing.small),
            Wrap(
              spacing: context.theme.appSpacing.small,
              runSpacing: context.theme.appSpacing.small,
              children: challenge.prizes
                  .map(
                    (prize) => Chip(
                      label: Text(
                        '${NumberFormat().format(prize.quantity)} x ${prize.name}',
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: context.theme.appSpacing.medium),
            Text(
              'Winners',
              style: context.theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (challenge.prizes.isEmpty)
              Text(
                'No winners drawn yet',
                style: context.theme.textTheme.bodyLarge,
              ),
            SizedBox(height: context.theme.appSpacing.small),
            ref.watch(winnersControllerProvider(challenge)).when(
                  data: (winners) {
                    return Wrap(
                      spacing: context.theme.appSpacing.small,
                      runSpacing: context.theme.appSpacing.small,
                      children: winners.entries.map((winner) {
                        final MapEntry(key: post, value: prize) = winner;
                        return Chip(
                          label:
                              Text('${post.owner.withAtSign} - ${prize.name}'),
                        );
                      }).toList(),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, _) => Text(error.toString()),
                ),

            // Wrap(
            //   spacing: context.theme.appSpacing.small,
            //   runSpacing: context.theme.appSpacing.small,
            //   children: challenge.prizes
            //       .map(
            //         (prize) => Chip(
            //           label: Text(
            //             '${NumberFormat().format(prize.quantity)} x ${prize.name}',
            //           ),
            //         ),
            //       )
            //       .toList(),
            // ),
            SizedBox(height: context.theme.appSpacing.medium),
          ],
        ),
      ),
    );
  }
}
