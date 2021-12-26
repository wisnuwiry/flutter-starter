abstract class ServerException implements Exception {
  const ServerException({required this.message, this.code});

  final String message;
  final Object? code;
}

class GeneralServerException extends ServerException {
  const GeneralServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() => 'GeneralServerException(message: $message, code: $code)';
}

class TimeOutServerException extends ServerException {
  const TimeOutServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() => 'TimeOutServerException(message: $message, code: $code)';
}

class NotFoundServerException extends ServerException {
  const NotFoundServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() =>
      'NotFoundServerException(message: $message, code: $code)';
}

class UnAuthenticationServerException extends ServerException {
  const UnAuthenticationServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() =>
      'UnAuthenticationServerException(message: $message, code: $code)';
}

class UnAuthorizeServerException extends ServerException {
  const UnAuthorizeServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() =>
      'UnAuthorizeServerException(message: $message, code: $code)';
}

class InternalServerException extends ServerException {
  const InternalServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );

  @override
  String toString() =>
      'InternalServerException(message: $message, code: $code)';
}
