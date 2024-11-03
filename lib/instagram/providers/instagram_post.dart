import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instagram_post.g.dart';

@Riverpod(keepAlive: true)
FutureOr<InstagramPost> instagramPost(Ref ref, String postId) {
  return ref.watch(instagramServiceProvider).getPost(postId);
}
