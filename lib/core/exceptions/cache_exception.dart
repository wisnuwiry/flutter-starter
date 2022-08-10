import 'package:flutter_starter/core/core.dart';

class GeneralCacheException extends ErrorException {
  const GeneralCacheException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() => 'GeneralCacheException(message: $message, code: $code)';
}

/// Throws when cache is empty or not found
///
class NotFoundCacheException extends GeneralCacheException {
  const NotFoundCacheException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() => 'NotFoundCacheException(message: $message, code: $code)';
}

/// Throw when cache is expired
class ExpiredCacheException extends GeneralCacheException {
  const ExpiredCacheException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() => 'ExpiredCacheException(message: $message, code: $code)';
}
