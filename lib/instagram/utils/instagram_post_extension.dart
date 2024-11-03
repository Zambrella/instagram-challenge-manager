import 'package:instagram_challenge_manager/challenge/domain/account.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:instagram_challenge_manager/instagram/domain/media_type.dart';
import 'package:instagram_models/instagram_models.dart';

extension InstragramPostX on InstagramPostDto {
  InstagramPost toDomain() {
    return InstagramPost(
      id: id,
      owner: Account(username),
      caption: caption,
      mediaType: MediaType.fromString(mediaType),
      mediaUrl: Uri.parse(mediaUrl),
      permalink: Uri.parse(permalink),
      timestamp: timestamp,
    );
  }
}
