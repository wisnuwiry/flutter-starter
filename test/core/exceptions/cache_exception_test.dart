import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/exceptions/', () {
    test('Test CacheException with dynamic type on code property', () {
      // arrange
      const expectedCodeInt = 500;
      const expectedCodeString = 'INTERNAL_SERVER_ERROR';
      const expectedCodeObject = <Object, Object>{};

      // actual
      const actualCodeInt = GeneralCacheException(message: 'test', code: 500);
      const actualCodeString =
          GeneralCacheException(message: 'test', code: 'INTERNAL_SERVER_ERROR');
      const actualCodeObject =
          GeneralCacheException(message: 'test', code: <Object, Object>{});

      // assert
      expect(actualCodeInt.code, expectedCodeInt);
      expect(actualCodeString.code, expectedCodeString);
      expect(actualCodeObject.code, expectedCodeObject);
    });

    test('NotFoundCacheException should be subclass of CacheException', () {
      // arrange
      const exception = NotFoundCacheException(message: 'message');

      // assert
      expect(exception, isA<GeneralCacheException>());
    });

    test('ExpiredCacheException should be subclass of CacheException', () {
      // arrange
      const exception = ExpiredCacheException(message: 'message');

      // assert
      expect(exception, isA<GeneralCacheException>());
    });

    test('Shoud be valid toString() override method', () {
      // arrange
      const baseExceptionString =
          'GeneralCacheException(message: Test Message, code: Test Code)';
      const notFoundExceptionString =
          'NotFoundCacheException(message: Test Message, code: Test Code)';
      const expiredExceptionString =
          'ExpiredCacheException(message: Test Message, code: Test Code)';

      // actual
      final baseExceptionResult = const GeneralCacheException(
        message: 'Test Message',
        code: 'Test Code',
      ).toString();
      final notFoundExceptionResult = const NotFoundCacheException(
        message: 'Test Message',
        code: 'Test Code',
      ).toString();
      final expiredExceptionResult = const ExpiredCacheException(
        message: 'Test Message',
        code: 'Test Code',
      ).toString();

      // assert
      expect(baseExceptionResult, baseExceptionString);
      expect(notFoundExceptionResult, notFoundExceptionString);
      expect(expiredExceptionResult, expiredExceptionString);
    });
  });
}
