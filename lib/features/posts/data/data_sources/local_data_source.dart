import 'dart:convert';

import 'package:hive/hive.dart';

import '../../../../core/core.dart';
import '../data.dart';

abstract class PostLocalDataSource implements CacheDataSource<List<PostModel>> {
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  PostLocalDataSourceImpl(this.hive);

  final HiveInterface hive;

  @override
  String cacheKey = 'POST_DATA_SOURCE_KEY';

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
  Future<List<PostModel>> getData() async {
    try {
      final box = await _getBox();
      final boxData = box.get('data');

      if (boxData != null) {
        final decodeData = json.decode(boxData);
        if (decodeData is List) {
          return List<PostModel>.from(
              decodeData.map((e) => PostModel.fromJson(e))).toList();
        }
      }

      throw const NotFoundCacheException(message: 'Cache Not Found');
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isExpired() async {
    try {
      final box = await _getBox();
      final timestamp = box.get('timestamp');

      if (timestamp != null && timestamp is int) {
        final expiredData = DateTime.fromMicrosecondsSinceEpoch(timestamp);
        final currentDate = DateTime.now();

        return currentDate.isBefore(expiredData);
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveCache(List<PostModel> data) async {
    try {
      final box = await _getBox();

      await box.put(
        'data',
        json.encode(data.map((e) => e.toJson()).toList()),
      );

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> setExpired(DateTime date) async {
    try {
      final box = await _getBox();

      await box.put('timestamp', date.millisecondsSinceEpoch);

      return true;
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

  Future<Box> _getBox() async {
    if (!hive.isBoxOpen(cacheKey)) {
      return hive.openBox(cacheKey);
    }

    return hive.box(cacheKey);
  }
}
