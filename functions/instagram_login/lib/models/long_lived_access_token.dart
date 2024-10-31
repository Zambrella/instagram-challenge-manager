class AccessTokenResponse {
  const AccessTokenResponse({
    required this.token,
    required this.expiresIn,
  });

  final String token;

  /// The number of seconds until the token expires.
  final int expiresIn;

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) {
    return AccessTokenResponse(
      token: json['access_token'] as String,
      expiresIn: json['expires_in'] as int,
    );
  }
}

class AccessToken {
  const AccessToken({
    required this.token,
    required this.userId,
    required this.expiresAt,
  });

  final String token;
  final String userId;
  final DateTime expiresAt;

  factory AccessToken.fromResponse({
    required AccessTokenResponse response,
    required String userId,
  }) {
    return AccessToken(
      token: response.token,
      userId: userId,
      expiresAt: DateTime.now().add(Duration(seconds: response.expiresIn)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'userId': userId,
      'expiresAt': expiresAt.toIso8601String(),
    };
  }
}
