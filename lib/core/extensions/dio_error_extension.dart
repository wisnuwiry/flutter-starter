import 'package:dio/dio.dart';

import '../core.dart';

extension DioErrorExtension on DioError {
  ServerException toServerException() {
    // TODO: Implement error message by your sever error message
    switch (type) {
      case DioErrorType.response:
        switch (response?.statusCode) {
          case 401:
            return UnAuthenticationServerException(message: message);
          case 403:
            return UnAuthorizeServerException(message: message);
          case 404:
            return NotFoundServerException(message: message);
          case 500:
          case 502:
            return InternalServerException(message: message);
          default:
            return GeneralServerException(message: message);
        }
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return TimeOutServerException(message: message);
      default:
    }
    return GeneralServerException(message: message);
  }
}
