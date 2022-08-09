import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  group('features/settings/domain/usecases/', () {
    const tInValidParams = RecordErrorParams(
      exception: 12,
      stackTrace: true,
    );

    test('Should props is valid all properties in RecordErrorParams', () {
      // arrange
      final expectedResult = [12, true, null];

      // actual
      final actualResult = tInValidParams.props;

      // assert
      expect(actualResult, expectedResult);
    });
  });
}
