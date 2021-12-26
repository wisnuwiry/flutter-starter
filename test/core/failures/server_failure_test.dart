import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/failures/', () {
    const tFailure = ServerFailure(message: 'Test Failure', code: 90);

    test('Should ServerFailure is SubClass of Failure', () async {
      expect(tFailure, isA<Failure>());
    });

    test('Should compare object ServerFailure is correctly', () async {
      expect(tFailure, tFailure);
      expect(tFailure == tFailure, true);
    });

    test('Should toString object ServerFailure is correctly', () async {
      expect(tFailure.toString(), 'ServerFailure(Test Failure, 90)');
    });
  });
}
