// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:flutter_starter/core/core.dart';

extension DioErrorExtension on DioError {
  ServerException toServerException() {
    switch (type) {
      // TODO(type): Implement error message by your sever error message.
      case DioErrorType.response:
        switch (response?.statusCode) {
          case 401:
            return UnAuthenticationServerException(
              message: message,
              code: response?.statusCode,
            );
          case 403:
            return UnAuthorizeServerException(
              message: message,
              code: response?.statusCode,
            );
          case 404:
            return NotFoundServerException(
              message: message,
              code: response?.statusCode,
            );
          case 500:
          case 502:
            return InternalServerException(
              message: message,
              code: response?.statusCode,
            );
          default:
            return GeneralServerException(
              message: message,
              code: response?.statusCode,
            );
        }

      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return TimeOutServerException(
          message: message,
          code: response?.statusCode,
        );

      case DioErrorType.cancel:
      case DioErrorType.other:
        return GeneralServerException(
          message: message,
          code: response?.statusCode,
        );
    }
  }
}
