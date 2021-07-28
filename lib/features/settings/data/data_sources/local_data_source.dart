import 'dart:convert';

import 'package:hive/hive.dart';

import '../../../../app/config.dart';
import '../../../../core/core.dart';
import '../data.dart';

abstract class SettingsLocalDataSource
    implements CacheDataSource<SettingsModel> {
  Future<bool> setTheme(AppTheme theme);

  Future<bool> setLanguage(Language language);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  SettingsLocalDataSourceImpl(this.hive);

  final HiveInterface hive;

  @override
  String cacheKey = 'SETTING_DATA_SOURCE_KEY';

  @override
  Future<bool> clearCache() async {
    try {
      final box = await _getBox();
      await box.clear();

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<SettingsModel> getData() async {
    try {
      final box = await _getBox();
      final boxData = box.get('data');

      if (boxData != null) {
        return SettingsModel.fromJson(json.decode(boxData));
      }

      throw const NotFoundCacheException(message: 'Cache Not Found');
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isCached() async {
    try {
      final box = await _getBox();

      return box.get('data') != null;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isExpired() async {
    return false;
  }

  @override
  Future<bool> saveCache(SettingsModel data) async {
    try {
      final box = await _getBox();

      await box.put('data', json.encode(data.toJson()));

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> setExpired(DateTime date) async {
    return true;
  }

  Future<Box> _getBox() async {
    if (!hive.isBoxOpen(cacheKey)) {
      return hive.openBox(cacheKey);
    }

    return hive.box(cacheKey);
  }

  @override
  Future<bool> setLanguage(Language language) async {
    try {
      if (await isCached()) {
        final currentData = await getData();

        await saveCache(currentData.copyWith(language: language));
        return true;
      }

      await saveCache(SettingsModel(
        theme: AppConfig.defaultTheme,
        language: language,
      ));

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> setTheme(AppTheme theme) async {
    try {
      if (await isCached()) {
        final currentData = await getData();

        await saveCache(currentData.copyWith(theme: theme));
        return true;
      }

      await saveCache(SettingsModel(
        theme: theme,
        language: null,
      ));

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
