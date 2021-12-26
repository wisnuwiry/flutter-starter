import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/failures/', () {
    const tFailure = CodeFailure(message: 'Test Failure', code: 90);

    test('Should CodeFailure is SubClass of Failure', () async {
      expect(tFailure, isA<Failure>());
    });

    test('Should compare object CodeFailure is correctly', () async {
      expect(tFailure, tFailure);
      expect(tFailure == tFailure, true);
    });

    test('Should toString object CodeFailure is correctly', () async {
      expect(tFailure.toString(), 'CodeFailure(Test Failure, 90)');
    });
  });
}
