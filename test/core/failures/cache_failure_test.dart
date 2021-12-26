import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/failures/', () {
    const tFailure = CacheFailure(message: 'Test Failure', code: 90);

    test('Should CacheFailure is SubClass of Failure', () async {
      expect(tFailure, isA<Failure>());
    });

    test('Should compare object CacheFailure is correctly', () async {
      expect(tFailure, tFailure);
      expect(tFailure == tFailure, true);
    });

    test('Should toString object CacheFailure is correctly', () async {
      expect(tFailure.toString(), 'CacheFailure(Test Failure, 90)');
    });
  });
}
