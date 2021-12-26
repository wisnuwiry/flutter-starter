/// Throws when code have error
///
class ErrorCodeException implements Exception {
  const ErrorCodeException({
    required this.message,
    this.code,
  });

  final String message;
  final Object? code;

  @override
  String toString() => 'ErrorCodeException(message: $message, code: $code)';
}
