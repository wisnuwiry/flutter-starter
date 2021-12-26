import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/exceptions/', () {
    test('Test ErrorCodeException with dynamic type on code property', () {
      // arrange
      const expectedCodeInt = 500;
      const expectedCodeString = 'something error in this code';
      const expectedCodeObject = <Object, Object>{};

      // actual
      const actualCodeInt = ErrorCodeException(message: 'test', code: 500);
      const actualCodeString = ErrorCodeException(
        message: 'test',
        code: 'something error in this code',
      );
      const actualCodeObject =
          ErrorCodeException(message: 'test', code: <Object, Object>{});

      // assert
      expect(actualCodeInt.code, expectedCodeInt);
      expect(actualCodeString.code, expectedCodeString);
      expect(actualCodeObject.code, expectedCodeObject);
    });

    test('ErrorCodeException should be subclass of Exception', () {
      // arrange
      const exception = ErrorCodeException(message: 'message');

      // assert
      expect(exception, isA<Exception>());
    });

    test('Shoud valid toString() ErrorCodeException', () {
      // arrange
      const expected =
          'ErrorCodeException(message: Test Message, code: Test Code)';

      // actual
      final actual =
          const ErrorCodeException(message: 'Test Message', code: 'Test Code')
              .toString();

      // assert
      expect(actual, expected);
    });
  });
}
