import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/utils.dart';

class MockSettingsRepository extends Mock implements SettingsRepositoryImpl {}

void main() {
  late SaveLanguageSettingUseCase useCase;
  late MockSettingsRepository mockRepository;

  setUp(() {
    mockRepository = MockSettingsRepository();
    useCase = SaveLanguageSettingUseCase(mockRepository);
  });

  final tLanguage = Language.fromJson(jsonFixture('language.json'));

  group('features/settings/domain/usecases/', () {
    test('Should save language setting to the settings repository correctly',
        () async {
      // arrange
      when(() => mockRepository.saveLanguageSetting(tLanguage))
          .thenAnswer((_) async => const Right(true));

      // actual
      final result = await useCase(tLanguage);

      // assert
      expect(result, const Right<Failure, bool>(true));
      verify(() => mockRepository.saveLanguageSetting(tLanguage));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
