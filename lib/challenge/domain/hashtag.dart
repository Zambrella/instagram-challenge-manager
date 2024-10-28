/// Representation of a hashtag without the leading `#` character.
extension type Hashtag(String value) {
  String get withHash => '#$value';
}
