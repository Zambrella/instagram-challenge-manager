import 'package:instagram_challenge_manager/instagram/domain/instagram_post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_post_controller.g.dart';

@Riverpod(keepAlive: true)
class SelectedPostController extends _$SelectedPostController {
  @override
  InstagramPost? build() {
    return null;
  }

  // ignore: use_setters_to_change_properties
  void setSelectedPost(InstagramPost post) {
    state = post;
  }
}
