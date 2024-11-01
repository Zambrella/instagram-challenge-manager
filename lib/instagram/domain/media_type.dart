enum MediaType {
  album,
  image,
  video;

  String get name {
    switch (this) {
      case MediaType.album:
        return 'ALBUM';
      case MediaType.image:
        return 'IMAGE';
      case MediaType.video:
        return 'VIDEO';
    }
  }

  static MediaType fromString(String value) {
    switch (value) {
      case 'ALBUM':
        return MediaType.album;
      case 'IMAGE':
        return MediaType.image;
      case 'VIDEO':
        return MediaType.video;
      default:
        throw Exception('Unknown media type: $value');
    }
  }
}
