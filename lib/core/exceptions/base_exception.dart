/// Base exception class [ErrorException]
abstract class ErrorException implements Exception {
  const ErrorException({required this.message, this.code, this.details});

  final String message;
  final Object? code;
  final Map<String, dynamic>? details;
}
