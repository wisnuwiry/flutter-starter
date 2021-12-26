import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/utils.dart';

class MockSettingsRepository extends Mock implements SettingsRepositoryImpl {}

void main() {
  late GetSettingsUseCase useCase;
  late MockSettingsRepository mockRepository;

  setUp(() {
    mockRepository = MockSettingsRepository();
    useCase = GetSettingsUseCase(mockRepository);
  });

  final tSettings = Settings.fromJson(jsonFixture('settings.json'));

  group('features/settings/domain/usecases/', () {
    test('Should get settings from the settings repository', () async {
      // arrange
      when(() => mockRepository.getSettings())
          .thenAnswer((_) async => Right(tSettings));

      // actual
      final result = await useCase(const NoParams());

      // assert
      expect(result, Right<Failure, Settings>(tSettings));
      verify(() => mockRepository.getSettings());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
