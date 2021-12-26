import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RecordErrorUseCase useCase;

  setUp(() {
    useCase = RecordErrorUseCase();
  });

  group('features/settings/domain/usecases/', () {
    final tValidParams = RecordErrorParams(
      exception: const CacheException(message: ''),
      reason: 'Some reason',
      stackTrace: StackTrace.current,
    );

    const tInValidParams = RecordErrorParams(
      exception: 12,
      stackTrace: true,
    );

    test('Should record error from exception with valid params correctly',
        () async {
      // actual
      final result = await useCase(tValidParams);

      // assert
      expect(result, const Right<Failure, bool>(true));
      expect(tValidParams, tValidParams);
      expect(tValidParams == tValidParams, true);
    });

    test('Should record error from exception with invalid params correctly',
        () async {
      // actual
      final result = await useCase(tInValidParams);

      // assert
      expect(result, const Right<Failure, bool>(true));
      expect(tValidParams, tValidParams);
      expect(tValidParams == tValidParams, true);
    });

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
