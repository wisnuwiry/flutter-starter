import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/utils.dart';

class MockSettingsRepository extends Mock implements SettingsRepositoryImpl {}

void main() {
  late GetLanguageSettingUseCase useCase;
  late MockSettingsRepository mockRepository;

  setUp(() {
    mockRepository = MockSettingsRepository();
    useCase = GetLanguageSettingUseCase(mockRepository);
  });

  final tLanguage = Language.fromJson(jsonFixture('language.json'));

  group('features/settings/domain/usecases/', () {
    test('Should get languageSetting data setting from the settings repository',
        () async {
      // arrange
      when(() => mockRepository.getLanguageSetting())
          .thenAnswer((_) async => Right(tLanguage));

      // actual
      final result = await useCase(const NoParams());

      // assert
      expect(result, Right<Failure, Language>(tLanguage));
      verify(() => mockRepository.getLanguageSetting());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
