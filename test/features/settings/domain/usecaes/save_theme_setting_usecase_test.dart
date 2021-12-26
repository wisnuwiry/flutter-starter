import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingsRepository extends Mock implements SettingsRepositoryImpl {}

void main() {
  late SaveThemeSettingUseCase useCase;
  late MockSettingsRepository mockRepository;

  setUp(() {
    mockRepository = MockSettingsRepository();
    useCase = SaveThemeSettingUseCase(mockRepository);
  });

  const tTheme = AppTheme.light;

  group('features/settings/domain/usecases/', () {
    test('Should save theme setting to the settings repository correctly',
        () async {
      // arrange
      when(() => mockRepository.saveThemeSetting(tTheme))
          .thenAnswer((_) async => const Right(true));

      // actual
      final result = await useCase(tTheme);

      // assert
      expect(result, const Right<Failure, bool>(true));
      verify(() => mockRepository.saveThemeSetting(tTheme));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
