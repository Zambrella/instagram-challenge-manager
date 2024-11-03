import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/theme/theme.dart';
import 'package:intl/intl.dart';

class InstagramPostWidget extends ConsumerStatefulWidget {
  const InstagramPostWidget({
    required this.post,
    required this.onPostTap,
    super.key,
  });

  final InstagramPost post;
  final VoidCallback onPostTap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InstagramPostWidgetState();
}

class _InstagramPostWidgetState extends ConsumerState<InstagramPostWidget> {
  InstagramPost get post => widget.post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPostTap,
      child: SizedBox(
        height: 250,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Ink.image(
                image: NetworkImage(post.mediaUrl!.toString()),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: context.theme.appSpacing.medium),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.theme.appSpacing.small,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        post.caption,
                        style: context.theme.textTheme.bodyLarge,
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(height: context.theme.appSpacing.small),
                    Text(
                      DateFormat.yMMMMd().format(post.timestamp),
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        color: context.theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
