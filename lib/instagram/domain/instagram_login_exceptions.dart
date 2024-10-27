sealed class InstagramLoginException implements Exception {
  const InstagramLoginException({
    required this.error,
    required this.reason,
    required this.description,
    required this.stackTrace,
  });

  final String error;
  final String reason;
  final String description;
  final StackTrace stackTrace;
}

class InstagramLoginCancelledException extends InstagramLoginException {
  const InstagramLoginCancelledException({
    required super.error,
    required super.reason,
    required super.description,
    required super.stackTrace,
  });
}

class InstagramLoginUnknownException extends InstagramLoginException {
  const InstagramLoginUnknownException({
    required super.error,
    required super.reason,
    required super.description,
    required super.stackTrace,
  });
}
