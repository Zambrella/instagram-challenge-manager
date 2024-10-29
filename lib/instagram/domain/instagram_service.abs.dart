// ignore: one_member_abstracts
import 'package:auth_core/auth_core.dart';

// ignore: one_member_abstracts
abstract class InstagramService {
  const InstagramService();

  /// Given a valid [url] with a code returned from Instagram,
  /// log the user into the app using the code.
  Future<AppUser> loginWithUrlCode(String url);
}
