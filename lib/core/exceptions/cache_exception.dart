class CacheException implements Exception {
  const CacheException({required this.message, this.code});

  final String message;
  final Object? code;
}

/// Throws when cache is empty or not found
///
class NotFoundCacheException extends CacheException {
  const NotFoundCacheException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );
}

/// Throw when cache is expired
class ExpiredCacheException extends CacheException {
  const ExpiredCacheException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );
}
