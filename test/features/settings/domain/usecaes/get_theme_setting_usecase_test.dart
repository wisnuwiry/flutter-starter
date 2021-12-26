import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingsRepository extends Mock implements SettingsRepositoryImpl {}

void main() {
  late GetThemeSettingUseCase useCase;
  late MockSettingsRepository mockRepository;

  setUp(() {
    mockRepository = MockSettingsRepository();
    useCase = GetThemeSettingUseCase(mockRepository);
  });

  const tTheme = AppTheme.light;

  group('features/settings/domain/usecases/', () {
    test('Should get languageSetting data setting from the settings repository',
        () async {
      // arrange
      when(() => mockRepository.getThemeSetting())
          .thenAnswer((_) async => const Right(tTheme));

      // actual
      final result = await useCase(const NoParams());

      // assert
      expect(result, const Right<Failure, AppTheme>(tTheme));
      verify(() => mockRepository.getThemeSetting());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
