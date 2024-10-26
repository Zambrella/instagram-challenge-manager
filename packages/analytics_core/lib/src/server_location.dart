/// Sealed class for defining server location types.
sealed class ServerLocation {
  const ServerLocation();
}

/// Server location defined by a URL.
class UrlServerLocation extends ServerLocation {
  /// Server location defined by a URL.
  const UrlServerLocation(this.url);

  /// The URL of the server.
  final String url;

  @override
  String toString() => 'UrlServerLocation(url: $url)';
}

/// Server location defined by a region.
class RegionServerLocation extends ServerLocation {
  /// Server location defined by a region.
  const RegionServerLocation(this.region);

  /// The region of the server.
  /// E.g. 'us', 'eu', 'asia'.
  final String region;

  @override
  String toString() => 'RegionServerLocation(region: $region)';
}
