// ignore: one_member_abstracts
abstract class InstagramLoginService {
  const InstagramLoginService();

  /// Given a valid [url] with a code returned from Instagram,
  /// log the user into the app using the code.
  Future<void> loginWithUrlCode(String url);
}
