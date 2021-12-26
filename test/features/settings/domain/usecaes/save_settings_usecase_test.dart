import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/utils.dart';

class MockSettingsRepository extends Mock implements SettingsRepositoryImpl {}

void main() {
  late SaveSettingsUseCase useCase;
  late MockSettingsRepository mockRepository;

  setUp(() {
    mockRepository = MockSettingsRepository();
    useCase = SaveSettingsUseCase(mockRepository);
  });

  final tSettings = Settings.fromJson(jsonFixture('settings.json'));

  group('features/settings/domain/usecases/', () {
    test('Should save all settings data to the settings repository correctly',
        () async {
      // arrange
      when(() => mockRepository.saveSettings(tSettings))
          .thenAnswer((_) async => const Right(true));

      // actual
      final result = await useCase(tSettings);

      // assert
      expect(result, const Right<Failure, bool>(true));
      verify(() => mockRepository.saveSettings(tSettings));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
