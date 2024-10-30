enum MediaType {
  album,
  image,
  video;

  String get name {
    switch (this) {
      case MediaType.album:
        return 'album';
      case MediaType.image:
        return 'image';
      case MediaType.video:
        return 'video';
    }
  }

  static MediaType fromString(String value) {
    switch (value) {
      case 'album':
        return MediaType.album;
      case 'image':
        return MediaType.image;
      case 'video':
        return MediaType.video;
      default:
        throw Exception('Unknown media type: $value');
    }
  }
}
