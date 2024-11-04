import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/instagram/providers/instagram_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_entries_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<InstagramPost>> challengeEntries(Ref ref, Challenge challenge) {
  return ref.watch(instagramServiceProvider).getChallengeEntries(challenge);
}
