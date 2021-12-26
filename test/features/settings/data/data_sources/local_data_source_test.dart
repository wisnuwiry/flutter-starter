import 'dart:convert';

import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/data/data.dart';
import 'package:flutter_starter/features/settings/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/utils.dart';

class MockHive extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box<Object?> {}

void main() {
  late SettingsLocalDataSourceImpl dataSource;
  late MockHive mockHive;
  late MockHiveBox mockHiveBox;

  setUp(() {
    mockHive = MockHive();
    mockHiveBox = MockHiveBox();
    dataSource = SettingsLocalDataSourceImpl(mockHive);
  });

  group('features/settings/data/data_sources/', () {
    const tSetting = Settings(
      language: Language(code: 'id', name: 'Indonesia'),
      theme: AppTheme.light,
    );

    final tLanguage = Language.fromJson(jsonFixture('language.json'));

    void _mockOpenBox() {
      when(() => mockHive.openBox<dynamic>(dataSource.cacheKey))
          .thenAnswer((_) async => mockHiveBox);
    }

    void _mockGetBox() {
      when(() => mockHive.box<dynamic>(dataSource.cacheKey))
          .thenAnswer((_) => mockHiveBox);
    }

    void _mockReturnData() {
      when(() => mockHiveBox.get('data')).thenAnswer(
        (_) => json.encode(tSetting.toJson()),
      );
    }

    void _mockReturnNullData() {
      when(() => mockHiveBox.get('data')).thenAnswer((_) => null);
    }

    void _mockBoxIsOpen() {
      when(() => mockHive.isBoxOpen(dataSource.cacheKey))
          .thenAnswer((_) => true);
    }

    void _mockBoxIsNotOpen() {
      when(() => mockHive.isBoxOpen(dataSource.cacheKey))
          .thenAnswer((_) => false);
    }

    void _mockSaveData() {
      when(() => mockHiveBox.put('data', any())).thenAnswer((_) async => () {});
    }

    void _mockClearCache() {
      when(() => mockHiveBox.clear()).thenAnswer((_) async => 0);
    }

    group('getData', () {
      test(
          'Should return Settings entity '
          'from local storage while box is not opened', () async {
        // arrange
        _mockOpenBox();
        _mockBoxIsNotOpen();
        _mockReturnData();

        // actual
        final result = await dataSource.getData();

        // assert
        verify(() => mockHive.openBox<dynamic>(dataSource.cacheKey));
        verify(() => mockHive.isBoxOpen(dataSource.cacheKey));
        verify(() => mockHiveBox.get('data'));
        expect(result, tSetting);
      });

      test(
          'Should return Settings entity '
          'from local storage while box is opened', () async {
        // arrange
        _mockBoxIsOpen();
        _mockGetBox();
        _mockReturnData();

        // actual
        final result = await dataSource.getData();

        // assert
        verify(() => mockHive.isBoxOpen(dataSource.cacheKey));
        verify(() => mockHive.box<dynamic>(dataSource.cacheKey));
        verify(() => mockHiveBox.get('data'));
        expect(result, tSetting);
      });

      test('Should throw a CacheException when there is not a cached value',
          () async {
        // arrange
        _mockOpenBox();
        _mockBoxIsNotOpen();
        _mockReturnNullData();

        // actual
        final result = dataSource.getData;

        // assert
        expect(result.call, throwsA(const TypeMatcher<CacheException>()));
      });
    });

    group('setData', () {
      test('Should save Settings data to local storage correctly', () async {
        // arrange
        _mockOpenBox();
        _mockBoxIsOpen();
        _mockGetBox();
        _mockSaveData();

        // actual
        final result = await dataSource.saveCache(tSetting);

        // assert
        verify(() => mockHive.isBoxOpen(dataSource.cacheKey));
        verify(() => mockHive.box<dynamic>(dataSource.cacheKey));
        verify(() => mockHiveBox.put('data', any()));
        expect(result, true);
      });

      test('Should throw CacheException when have any error in open hive box',
          () async {
        // arrange
        _mockBoxIsNotOpen();
        _mockSaveData();

        // actual
        final result = dataSource.saveCache;

        // assert
        expect(
          () => result.call(tSetting),
          throwsA(const TypeMatcher<CacheException>()),
        );
      });
    });

    group('setTheme', () {
      test('Should correct set theme data when current data is null', () async {
        // arrange
        _mockBoxIsOpen();
        _mockGetBox();
        _mockReturnNullData();
        _mockSaveData();

        // actual
        final result = await dataSource.setTheme(AppTheme.dark);

        // assert
        expect(result, true);
      });

      test('Should correct set theme data when current data is available',
          () async {
        // arrange
        _mockBoxIsOpen();
        _mockGetBox();
        _mockReturnData();
        _mockSaveData();

        // actual
        final result = await dataSource.setTheme(AppTheme.dark);

        // assert
        expect(result, true);
      });

      test('Should throw CacheException when have any error in open hive box',
          () async {
        // arrange
        _mockBoxIsNotOpen();
        _mockSaveData();

        // actual
        final result = dataSource.setTheme;

        // assert
        expect(
          () => result.call(AppTheme.dark),
          throwsA(const TypeMatcher<CacheException>()),
        );
      });
    });

    group('setLanguage', () {
      test('Should correct set language data when current data is null',
          () async {
        // arrange
        _mockBoxIsOpen();
        _mockGetBox();
        _mockReturnNullData();
        _mockSaveData();

        // actual
        final result = await dataSource.setLanguage(tLanguage);

        // assert
        expect(result, true);
      });

      test('Should correct set language data when current data is available',
          () async {
        // arrange
        _mockBoxIsOpen();
        _mockGetBox();
        _mockReturnData();
        _mockSaveData();

        // actual
        final result = await dataSource.setLanguage(tLanguage);

        // assert
        expect(result, true);
      });

      test('Should throw CacheException when have any error in open hive box',
          () async {
        // arrange
        _mockBoxIsNotOpen();
        _mockSaveData();

        // actual
        final result = dataSource.setLanguage;

        // assert
        expect(
          () => result.call(tLanguage),
          throwsA(const TypeMatcher<CacheException>()),
        );
      });
    });

    group('isCached', () {
      test('Should return false when current local data is null', () async {
        // arrange
        _mockBoxIsOpen();
        _mockGetBox();
        _mockReturnData();

        // actual
        final result = await dataSource.isCached();

        // assert
        verify(() => mockHiveBox.get('data'));
        expect(result, true);
      });

      test('Should return true when current local data is not null', () async {
        // arrange
        _mockBoxIsOpen();
        _mockGetBox();
        _mockReturnNullData();

        // actual
        final result = await dataSource.isCached();

        // assert
        verify(() => mockHiveBox.get('data'));
        expect(result, false);
      });

      test('Should throw CacheException when have any error in open hive box',
          () async {
        // arrange
        _mockBoxIsNotOpen();
        _mockReturnData();

        // actual
        final result = dataSource.isCached;

        // assert
        expect(result.call, throwsA(const TypeMatcher<CacheException>()));
      });
    });

    group('clearCache', () {
      test('Should clear data local storage corrcetly', () async {
        // arrange
        _mockBoxIsOpen();
        _mockGetBox();
        _mockClearCache();

        // actual
        final result = await dataSource.clearCache();

        // assert
        verify(() => mockHiveBox.clear());
        expect(result, true);
      });

      test('Should throw CacheException when have any error in open hive box',
          () async {
        // arrange
        _mockBoxIsNotOpen();
        _mockClearCache();

        // actual
        final result = dataSource.clearCache;

        // assert
        expect(result.call, throwsA(const TypeMatcher<CacheException>()));
      });
    });
  });
}
