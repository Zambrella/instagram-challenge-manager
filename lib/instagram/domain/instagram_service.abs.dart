// ignore: one_member_abstracts
import 'package:auth_core/auth_core.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';

// ignore: one_member_abstracts
abstract class InstagramService {
  const InstagramService();

  /// Given a valid [url] with a code returned from Instagram,
  /// log the user into the app using the code.
  Future<AppUser> loginWithUrlCode(String url);

  /// Gets a list of the user's Instagram posts.
  /// https://developers.facebook.com/docs/instagram-platform/instagram-graph-api/reference/ig-user/media#reading
  Future<List<InstagramPost>> getUserPosts();

  /// Gets a single Instagram post by its [postId].
  Future<InstagramPost> getPost(String postId);
}
