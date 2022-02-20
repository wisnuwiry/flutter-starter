import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_starter/app/config.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockGetThemeSettingUseCase extends Mock
    implements GetThemeSettingUseCase {}

class MockSaveThemeSettingUseCase extends Mock
    implements SaveThemeSettingUseCase {}

void main() {
  late MockGetThemeSettingUseCase mockGetThemeSetting;
  late MockSaveThemeSettingUseCase mockSaveThemeSetting;

  setUp(() {
    mockGetThemeSetting = MockGetThemeSettingUseCase();
    mockSaveThemeSetting = MockSaveThemeSettingUseCase();
  });

  const tTheme = AppTheme.dark;
  const tConfigDefaultTheme = AppConfig.defaultTheme;

  void _mockGetThemeSuccess(AppTheme theme) {
    when(() => mockGetThemeSetting.call(const NoParams())).thenAnswer(
      (_) async => Right<Failure, AppTheme>(theme),
    );
  }

  void _mockGetThemeFailure() {
    when(() => mockGetThemeSetting.call(const NoParams())).thenAnswer(
      (_) async => const Left<Failure, AppTheme>(CodeFailure(message: '')),
    );
  }

  void _mockSaveThemeSuccess(AppTheme theme) {
    when(() => mockSaveThemeSetting.call(theme)).thenAnswer(
      (_) async => const Right<Failure, bool>(true),
    );
  }

  void _mockSaveThemeFailure(AppTheme theme) {
    when(() => mockSaveThemeSetting.call(theme)).thenAnswer(
      (_) async => const Left<Failure, bool>(CodeFailure(message: '')),
    );
  }

  void _mockCrashSaveTheme() {
    when(() => mockSaveThemeSetting.call(tTheme))
        .thenThrow(const CacheException(message: ''));
  }

  group('features/settings/presentation/blocs/theme/', () {
    test('Should intial ThemeState is correctly', () async {
      // arrange
      final tBloc = ThemeBloc(
        getThemeSetting: mockGetThemeSetting,
        saveThemeSetting: mockSaveThemeSetting,
      );
      const expectedState = ThemeState(AppConfig.defaultTheme);

      // actual
      final actualState = tBloc.state;

      // assert
      expect(actualState, expectedState);
    });

    test('Should ThemeState code is correctly', () {
      // arrange
      const tState = ThemeState(tTheme);

      // assert
      expect(tState == tState, true);
      expect(tState.props, [tTheme]);
    });

    test('Should all bloc event ThemeEvent is correctly', () {
      // arrange
      const tThemeStarted = ThemeStarted();
      const tThemeChanged = ThemeChanged(tTheme);

      // actual

      // assert
      expect(tThemeStarted, isA<ThemeEvent>());
      expect(tThemeChanged, isA<ThemeEvent>());
      expect(tThemeStarted, tThemeStarted);
      expect(tThemeChanged, tThemeChanged);
      expect(tThemeStarted.props, <Object?>[]);
      expect(tThemeChanged.props, [tThemeChanged.theme]);
    });

    group('initalizeTheme', () {
      blocTest<ThemeBloc, ThemeState>(
        'Emit intial state with current saved data theme',
        build: () {
          _mockGetThemeSuccess(tConfigDefaultTheme);

          return ThemeBloc(
            getThemeSetting: mockGetThemeSetting,
            saveThemeSetting: mockSaveThemeSetting,
          );
        },
        act: (bloc) => bloc.add(const ThemeStarted()),
        expect: () => [const ThemeState(tConfigDefaultTheme)],
      );

      blocTest<ThemeBloc, ThemeState>(
        'Initialize without have saved theme data',
        build: () {
          _mockGetThemeFailure();

          return ThemeBloc(
            getThemeSetting: mockGetThemeSetting,
            saveThemeSetting: mockSaveThemeSetting,
          );
        },
        act: (bloc) => bloc.add(const ThemeStarted()),
        expect: () => [const ThemeState(tConfigDefaultTheme)],
      );
    });
    group('changeTheme', () {
      blocTest<ThemeBloc, ThemeState>(
        'Cannot change state when save to locally is failure',
        build: () {
          _mockGetThemeFailure();
          _mockSaveThemeFailure(tTheme);

          return ThemeBloc(
            getThemeSetting: mockGetThemeSetting,
            saveThemeSetting: mockSaveThemeSetting,
          );
        },
        act: (bloc) => bloc
          ..add(const ThemeStarted())
          ..add(const ThemeChanged(tTheme)),
        expect: () => <ThemeState>[const ThemeState(tConfigDefaultTheme)],
      );

      blocTest<ThemeBloc, ThemeState>(
        'Emit new theme when save data to local is successful',
        build: () {
          _mockSaveThemeSuccess(tTheme);
          _mockGetThemeSuccess(tTheme);

          return ThemeBloc(
            getThemeSetting: mockGetThemeSetting,
            saveThemeSetting: mockSaveThemeSetting,
          );
        },
        act: (bloc) => bloc
          ..add(const ThemeStarted())
          ..add(const ThemeChanged(tTheme)),
        expect: () => const [
          ThemeState(tTheme),
        ],
      );

      blocTest<ThemeBloc, ThemeState>(
        'Should emit [] when have any exception',
        setUp: () {
          GetIt.I.registerLazySingleton(RecordErrorUseCase.new);
        },
        tearDown: () {
          GetIt.I.reset();
        },
        build: () {
          _mockCrashSaveTheme();

          return ThemeBloc(
            getThemeSetting: mockGetThemeSetting,
            saveThemeSetting: mockSaveThemeSetting,
          );
        },
        act: (bloc) => bloc
          ..add(const ThemeStarted())
          ..add(const ThemeChanged(tTheme)),
        expect: () => <ThemeState>[],
      );
    });
  });
}
