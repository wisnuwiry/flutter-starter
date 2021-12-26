import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/exceptions/', () {
    test('Test ServerException with dynamic type on code property', () {
      // arrange
      const expectedCodeInt = 500;
      const expectedCodeString = 'INTERNAL_SERVER_ERROR';
      const expectedCodeObject = <Object, Object>{};

      // actual
      const actualCodeInt = GeneralServerException(message: 'test', code: 500);
      const actualCodeString = GeneralServerException(
        message: 'test',
        code: 'INTERNAL_SERVER_ERROR',
      );
      const actualCodeObject =
          GeneralServerException(message: 'test', code: <Object, Object>{});

      // assert
      expect(actualCodeInt.code, expectedCodeInt);
      expect(actualCodeString.code, expectedCodeString);
      expect(actualCodeObject.code, expectedCodeObject);
    });

    test('GeneralServerException should be subclass of ServerException', () {
      // arrange
      const exception = GeneralServerException(message: 'message');

      // assert
      expect(exception, isA<ServerException>());
    });

    test('TimeOutServerException should be subclass of ServerException', () {
      // arrange
      const exception = TimeOutServerException(message: 'message');

      // assert
      expect(exception, isA<ServerException>());
    });

    test('NotFoundServerException should be subclass of ServerException', () {
      // arrange
      const exception = NotFoundServerException(message: 'message');

      // assert
      expect(exception, isA<ServerException>());
    });

    test(
        'UnAuthenticationServerException should be subclass of ServerException',
        () {
      // arrange
      const exception = UnAuthenticationServerException(message: 'message');

      // assert
      expect(exception, isA<ServerException>());
    });

    test('UnAuthorizeServerException should be subclass of ServerException',
        () {
      // arrange
      const exception = UnAuthorizeServerException(message: 'message');

      // assert
      expect(exception, isA<ServerException>());
    });

    test('InternalServerException should be subclass of ServerException', () {
      // arrange
      const exception = InternalServerException(message: 'message');

      // assert
      expect(exception, isA<ServerException>());
    });

    test('Shoud be valid toString() override method', () {
      // arrange
      const generalExceptionString =
          'GeneralServerException(message: Test Message, code: Test Code)';
      const timeOutExceptionString =
          'TimeOutServerException(message: Test Message, code: Test Code)';
      const notFoundExceptionString =
          'NotFoundServerException(message: Test Message, code: Test Code)';
      const unAuthenticationExceptionString =
          'UnAuthenticationServerException(message: Test Message,'
          ' code: Test Code)';
      const unAuthorizeExceptionString =
          'UnAuthorizeServerException(message: Test Message, code: Test Code)';
      const internalExceptionString =
          'InternalServerException(message: Test Message, code: Test Code)';

      // actual
      final generalExceptionResult = const GeneralServerException(
        message: 'Test Message',
        code: 'Test Code',
      ).toString();
      final timeOutExceptionResult = const TimeOutServerException(
        message: 'Test Message',
        code: 'Test Code',
      ).toString();
      final notFoundExceptionResult = const NotFoundServerException(
        message: 'Test Message',
        code: 'Test Code',
      ).toString();
      final unAuthenticationExceptionResult =
          const UnAuthenticationServerException(
        message: 'Test Message',
        code: 'Test Code',
      ).toString();
      final unAuthorizeExceptionResult = const UnAuthorizeServerException(
        message: 'Test Message',
        code: 'Test Code',
      ).toString();
      final internalExceptionResult = const InternalServerException(
        message: 'Test Message',
        code: 'Test Code',
      ).toString();

      // assert
      expect(generalExceptionResult, generalExceptionString);
      expect(timeOutExceptionResult, timeOutExceptionString);
      expect(notFoundExceptionResult, notFoundExceptionString);
      expect(unAuthenticationExceptionResult, unAuthenticationExceptionString);
      expect(unAuthorizeExceptionResult, unAuthorizeExceptionString);
      expect(internalExceptionResult, internalExceptionString);
    });
  });
}
