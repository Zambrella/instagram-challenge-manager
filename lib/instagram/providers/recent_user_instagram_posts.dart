import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_user_instagram_posts.g.dart';

@riverpod
FutureOr<List<InstagramPost>> recentUserInstagramPosts(Ref ref) {
  return ref.watch(instagramServiceProvider).getUserPosts();
}
