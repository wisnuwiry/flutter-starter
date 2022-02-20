import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/utils.dart';

class MockGetLanguageSettingUseCase extends Mock
    implements GetLanguageSettingUseCase {}

class MockSaveLanguageSettingUseCase extends Mock
    implements SaveLanguageSettingUseCase {}

class MockGetSupportedLanguageUseCase extends Mock
    implements GetSupportedLanguageUseCase {}

void main() {
  late MockGetLanguageSettingUseCase mockGetLanguageSetting;
  late MockSaveLanguageSettingUseCase mockSaveLanguageSetting;
  late MockGetSupportedLanguageUseCase mockSupportedLanguage;

  setUp(() {
    mockGetLanguageSetting = MockGetLanguageSettingUseCase();
    mockSaveLanguageSetting = MockSaveLanguageSettingUseCase();
    mockSupportedLanguage = MockGetSupportedLanguageUseCase();
  });

  setUpAll(() {
    registerFallbackValue(
      SupportedLanguageParams(
        locales: AppLocalizations.supportedLocales,
        referenceLanguages: LanguagesData.data,
      ),
    );
  });

  final tLanguage = Language.fromJson(jsonFixture('language.json'));
  const tLanguage2 = Language(code: 'en', name: 'English');
  final tSupportedLanguage = [tLanguage, tLanguage2];

  void _mockGetSupportedLanguage() {
    when(
      () => mockSupportedLanguage.call(any()),
    ).thenAnswer(
      (_) async => Right<Failure, List<Language>>(tSupportedLanguage),
    );
  }

  void _mockGetLanguageSuccess() {
    when(() => mockGetLanguageSetting.call(const NoParams())).thenAnswer(
      (_) async => Right<Failure, Language>(
        tLanguage,
      ),
    );
  }

  void _mockGetLanguageFailure() {
    when(() => mockGetLanguageSetting.call(const NoParams())).thenAnswer(
      (_) async => const Left<Failure, Language>(CodeFailure(message: '')),
    );
  }

  void _mockSaveLanguageSuccess() {
    when(() => mockSaveLanguageSetting.call(tLanguage)).thenAnswer(
      (_) async => const Right<Failure, bool>(true),
    );
  }

  void _mockSaveLanguageFailure() {
    when(() => mockSaveLanguageSetting.call(tLanguage)).thenAnswer(
      (_) async => const Left<Failure, bool>(CodeFailure(message: '')),
    );
  }

  void _mockCrashSaveLanguage() {
    when(() => mockSaveLanguageSetting.call(tLanguage))
        .thenThrow(const FormatException());
  }

  group('features/settings/presentation/blocs/language/', () {
    test('Should intial LanguageState is correctly', () async {
      // arrange
      final tBloc = LanguageBloc(
        getLanguageSetting: mockGetLanguageSetting,
        saveLanguageSetting: mockSaveLanguageSetting,
        getSupportedLanguage: mockSupportedLanguage,
      );
      const expectedState = LanguageState(null, []);

      // actual
      final actualState = tBloc.state;

      // assert
      expect(actualState, expectedState);
    });

    test('Should LanguageState code is correctly', () {
      // arrange
      const tState = LanguageState(null, []);

      // actual
      final tStateCopy = tState.copyWith(
        language: tLanguage,
        supportedLanguages: tSupportedLanguage,
      );

      final tStateCopy2 = tStateCopy.copyWith();

      // assert
      expect(tState == tState, true);
      expect(tStateCopy == tStateCopy, true);
      expect(tStateCopy.language, tLanguage);
      expect(tStateCopy.supportedLanguages.length, 2);
      expect(tStateCopy2, tStateCopy);
    });

    test('Should all bloc event LanguageEvent is correctly', () {
      // arrange
      const tLanguageStarted = LanguageStarted();
      final tLanguageChanged = LanguageChanged(tLanguage);

      // actual

      // assert
      expect(tLanguageStarted, isA<LanguageEvent>());
      expect(tLanguageChanged, isA<LanguageEvent>());
      expect(tLanguageStarted, tLanguageStarted);
      expect(tLanguageChanged, tLanguageChanged);
      expect(tLanguageStarted.props, <Object?>[]);
      expect(tLanguageChanged.props, [tLanguageChanged.language]);
    });

    group('initalizeLanguage', () {
      blocTest<LanguageBloc, LanguageState>(
        'Emit current saved data language',
        build: () {
          _mockGetLanguageSuccess();
          _mockGetSupportedLanguage();

          return LanguageBloc(
            getLanguageSetting: mockGetLanguageSetting,
            saveLanguageSetting: mockSaveLanguageSetting,
            getSupportedLanguage: mockSupportedLanguage,
          );
        },
        act: (bloc) => bloc.add(const LanguageStarted()),
        expect: () => [
          LanguageState(null, tSupportedLanguage),
          LanguageState(tLanguage, tSupportedLanguage)
        ],
      );

      blocTest<LanguageBloc, LanguageState>(
        'Initialize without have saved language data',
        build: () {
          _mockGetLanguageFailure();
          _mockGetSupportedLanguage();

          return LanguageBloc(
            getLanguageSetting: mockGetLanguageSetting,
            saveLanguageSetting: mockSaveLanguageSetting,
            getSupportedLanguage: mockSupportedLanguage,
          );
        },
        act: (bloc) => bloc.add(const LanguageStarted()),
        expect: () => [
          LanguageState(null, tSupportedLanguage),
        ],
      );
    });
    group('changeLanguage', () {
      blocTest<LanguageBloc, LanguageState>(
        'Cannot change state when save to locally is failure',
        build: () {
          _mockGetLanguageFailure();
          _mockSaveLanguageFailure();
          _mockGetSupportedLanguage();

          return LanguageBloc(
            getLanguageSetting: mockGetLanguageSetting,
            saveLanguageSetting: mockSaveLanguageSetting,
            getSupportedLanguage: mockSupportedLanguage,
          );
        },
        act: (bloc) => bloc
          ..add(const LanguageStarted())
          ..add(LanguageChanged(tLanguage)),
        expect: () => <LanguageState>[
          LanguageState(null, tSupportedLanguage),
        ],
      );

      blocTest<LanguageBloc, LanguageState>(
        'Emit new language when save data to local is successful',
        build: () {
          _mockSaveLanguageSuccess();
          _mockGetLanguageSuccess();
          _mockGetSupportedLanguage();

          return LanguageBloc(
            getLanguageSetting: mockGetLanguageSetting,
            saveLanguageSetting: mockSaveLanguageSetting,
            getSupportedLanguage: mockSupportedLanguage,
          );
        },
        act: (bloc) => bloc
          ..add(const LanguageStarted())
          ..add(LanguageChanged(tLanguage)),
        expect: () => [
          LanguageState(null, tSupportedLanguage),
          LanguageState(tLanguage, tSupportedLanguage),
        ],
      );

      blocTest<LanguageBloc, LanguageState>(
        'Should emit [] when have any exception',
        setUp: () {
          GetIt.I.registerLazySingleton(RecordErrorUseCase.new);
        },
        tearDown: () {
          GetIt.I.reset();
        },
        build: () {
          _mockCrashSaveLanguage();

          return LanguageBloc(
            getLanguageSetting: mockGetLanguageSetting,
            saveLanguageSetting: mockSaveLanguageSetting,
            getSupportedLanguage: mockSupportedLanguage,
          );
        },
        act: (bloc) => bloc
          ..add(const LanguageStarted())
          ..add(LanguageChanged(tLanguage)),
        expect: () => <LanguageState>[],
      );
    });
  });
}
