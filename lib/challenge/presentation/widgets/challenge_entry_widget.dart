import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/entry_status.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ChallengeEntryWidget extends ConsumerStatefulWidget {
  const ChallengeEntryWidget({
    required this.post,
    required this.status,
    this.onApprove,
    super.key,
  });

  final InstagramPost post;
  final EntryStatus status;
  final VoidCallback? onApprove;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChallengeEntryWidgetState();
}

class _ChallengeEntryWidgetState extends ConsumerState<ChallengeEntryWidget> {
  InstagramPost get post => widget.post;

  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () async {
          await launchUrl(post.permalink);
        },
        onHover: (isHovered) {
          setState(() {
            _isHovered = isHovered;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(context.theme.appSpacing.small),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.owner.withAtSign,
                    style: context.theme.textTheme.bodyLarge,
                  ),
                  Text(
                    DateFormat.yMMMd().format(post.timestamp),
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Ink.image(
                    image: NetworkImage(post.mediaUrl!.toString()),
                  ),
                ),
                if (_isHovered)
                  Positioned.fill(
                    child: ColoredBox(
                      color: context.theme.colorScheme.surface.withOpacity(0.3),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.open_in_browser,
                              size: 36,
                            ),
                            Text(
                              'Click to view post',
                              style: context.theme.textTheme.headlineSmall!
                                  .copyWith(
                                color: context.theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.theme.appSpacing.small),
                child: (widget.status == EntryStatus.pending)
                    ? Text(
                        post.caption,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Row(
              children: [
                if (widget.status == EntryStatus.pending ||
                    widget.status == EntryStatus.invalid)
                  Expanded(
                    child: TextButton.icon(
                      onPressed: widget.onApprove,
                      icon: const Icon(Icons.thumb_up),
                      label: const Text('Approve'),
                    ),
                  ),
                if (widget.status == EntryStatus.pending ||
                    widget.status == EntryStatus.valid)
                  Expanded(
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: context.theme.colorScheme.error,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.cancel),
                      label: const Text('Reject'),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
