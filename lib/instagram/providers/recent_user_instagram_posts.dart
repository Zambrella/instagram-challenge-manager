import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/instagram/domain/media_type.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_user_instagram_posts.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<InstagramPost>> recentUserInstagramPosts(Ref ref) async {
  final allPosts = await ref.watch(instagramServiceProvider).getUserPosts();
  final allImagePosts = allPosts
      .where(
        (post) =>
            post.mediaType == MediaType.image ||
            post.mediaType == MediaType.album ||
            post.mediaType == MediaType.carouselAlbum,
      )
      .where(
        (post) => post.mediaUrl != null,
      );
  return allImagePosts.toList();
}
