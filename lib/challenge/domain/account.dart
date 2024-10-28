/// Representation of an Instagram account without the leader `@`.
extension type Account(String value) {
  String get withAtSign => '@$value';
}
