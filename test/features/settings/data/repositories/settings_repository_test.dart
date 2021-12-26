import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/utils.dart';

class MockSettingsLocalDataSource extends Mock
    implements SettingsLocalDataSourceImpl {}

void main() {
  late SettingsLocalDataSourceImpl mockLocalDataSource;
  late SettingsRepositoryImpl repository;

  setUp(() {
    mockLocalDataSource = MockSettingsLocalDataSource();
    repository = SettingsRepositoryImpl(localDataSource: mockLocalDataSource);
  });

  final tSetting = Settings.fromJson(jsonFixture('settings.json'));

  final tLanguage = Language.fromJson(jsonFixture('language.json'));

  const tTheme = AppTheme.light;

  group('features/settings/data/repositories/', () {
    group('getSettings', () {
      test('Should get full data settings correctly', () async {
        // arrange
        when(() => mockLocalDataSource.getData())
            .thenAnswer((_) async => tSetting);

        // actual
        final result = await repository.getSettings();

        // assert
        expect(result, equals(Right<Failure, Settings>(tSetting)));
      });

      test('Should throw CacheFailure when saved data is null', () async {
        // arrange
        const expectedFailure = CacheFailure(message: 'Cache Not Found');
        when(() => mockLocalDataSource.getData()).thenThrow(
          const NotFoundCacheException(message: 'Cache Not Found'),
        );

        // actual
        final result = await repository.getSettings();

        // assert
        expect(result, equals(const Left<Failure, Settings>(expectedFailure)));
      });
    });

    group('getLanguageSetting', () {
      test('Should get language settings correctly', () async {
        // arrange
        when(() => mockLocalDataSource.getData())
            .thenAnswer((_) async => tSetting);

        // actual
        final result = await repository.getLanguageSetting();

        // assert
        expect(result, equals(Right<Failure, Language>(tLanguage)));
      });

      test('Should throw CacheFailure when saved data is null', () async {
        // arrange
        const expectedFailure = CacheFailure(message: 'Cache Not Found');
        when(() => mockLocalDataSource.getData()).thenThrow(
          const NotFoundCacheException(message: 'Cache Not Found'),
        );

        // actual
        final result = await repository.getLanguageSetting();

        // assert
        expect(result, equals(const Left<Failure, Language>(expectedFailure)));
      });
    });

    group('getThemeSetting', () {
      test('Should get theme settings correctly', () async {
        // arrange
        when(() => mockLocalDataSource.getData())
            .thenAnswer((_) async => tSetting);

        // actual
        final result = await repository.getThemeSetting();

        // assert
        expect(result, equals(const Right<Failure, AppTheme>(tTheme)));
      });

      test('Should throw CacheFailure when saved data is null', () async {
        // arrange
        const expectedFailure = CacheFailure(message: 'Cache Not Found');
        when(() => mockLocalDataSource.getData()).thenThrow(
          const NotFoundCacheException(message: 'Cache Not Found'),
        );

        // actual
        final result = await repository.getThemeSetting();

        // assert
        expect(result, equals(const Left<Failure, AppTheme>(expectedFailure)));
      });
    });

    group('saveSettings', () {
      test('Should save settings data correcty', () async {
        // arrange
        when(() => mockLocalDataSource.saveCache(tSetting))
            .thenAnswer((_) async => true);

        // actual
        final result = await repository.saveSettings(tSetting);

        // assert
        expect(result, equals(const Right<Failure, bool>(true)));
      });

      test('Should throw CacheFailure when any some error in DataSource',
          () async {
        // arrange
        const expectedFailure = CacheFailure(message: 'Someting Error');
        when(() => mockLocalDataSource.saveCache(tSetting)).thenThrow(
          const CacheException(message: 'Someting Error'),
        );

        // actual
        final result = await repository.saveSettings(tSetting);

        // assert
        expect(result, equals(const Left<Failure, AppTheme>(expectedFailure)));
      });
    });

    group('saveLanguageSetting', () {
      test('Should save language setting data correcty', () async {
        // arrange
        when(() => mockLocalDataSource.setLanguage(tLanguage))
            .thenAnswer((_) async => true);

        // actual
        final result = await repository.saveLanguageSetting(tLanguage);

        // assert
        expect(result, equals(const Right<Failure, bool>(true)));
      });

      test('Should throw CacheFailure when any some error in DataSource',
          () async {
        // arrange
        const expectedFailure = CacheFailure(message: 'Someting Error');
        when(() => mockLocalDataSource.setLanguage(tLanguage)).thenThrow(
          const CacheException(message: 'Someting Error'),
        );

        // actual
        final result = await repository.saveLanguageSetting(tLanguage);

        // assert
        expect(result, equals(const Left<Failure, bool>(expectedFailure)));
      });
    });

    group('saveThemeSetting', () {
      test('Should save theme setting data correcty', () async {
        // arrange
        when(() => mockLocalDataSource.setTheme(tTheme))
            .thenAnswer((_) async => true);

        // actual
        final result = await repository.saveThemeSetting(tTheme);

        // assert
        expect(result, equals(const Right<Failure, bool>(true)));
      });

      test('Should throw CacheFailure when any some error in DataSource',
          () async {
        // arrange
        const expectedFailure = CacheFailure(message: 'Someting Error');
        when(() => mockLocalDataSource.setTheme(tTheme)).thenThrow(
          const CacheException(message: 'Someting Error'),
        );

        // actual
        final result = await repository.saveThemeSetting(tTheme);

        // assert
        expect(result, equals(const Left<Failure, bool>(expectedFailure)));
      });
    });
  });
}
