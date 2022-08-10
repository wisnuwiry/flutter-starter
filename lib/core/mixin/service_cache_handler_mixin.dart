import 'dart:developer';

import 'package:flutter_starter/core/core.dart';
import 'package:hive/hive.dart';

/// Callback when the request is success.
typedef CacheResponseCallBack<T> = Future<T> Function(T value);

/// Callback when hive Box is success
typedef _SuccessResponseBoxCallBack<T> = Future<T> Function(Box<T> box);

/// {@template service_cache_handler_mixin}
/// Mixin to handle the cache/local data request.
/// {@endtemplate}
mixin ServiceCacheHandlerMixin {
  /// Returns the value associated with the given [dataKey]. If the key does not
  /// exist, throw [NotFoundCacheException]. And ff nay error
  /// about cahe, throw [GeneralCacheException].
  ///
  /// Params:
  /// - [cache] `required` an instance of [Hive]
  /// - [boxKey] `required` [Box] of [Hive]
  /// - [dataKey] `required` key to get the value from [Box]
  /// - [onSuccess] callback when the request is success
  ///
  /// Examples
  /// ```dart
  /// // Example 1
  /// final result = await getCache<String>(
  ///    Hive,
  ///    boxKey: 'BOX_KEY',
  ///    dataKey: 'DATA_KEY',
  /// );
  ///
  /// return AuthDataResponse.fromJson(json.decode(result));
  ///
  /// // Example 2:
  /// getCache<bool>(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///  );
  ///
  /// ```
  Future<T> getCache<T>(
    HiveInterface cache, {
    required String boxKey,
    required String dataKey,
    CacheResponseCallBack<T>? onSuccess,
  }) async {
    return _callWithErrorHandler<T>(
      cache: cache,
      boxKey: boxKey,
      action: (box) async {
        final data = box.get(dataKey);
        if (data is! T) {
          // throw error when data is not found
          throw const NotFoundCacheException(
            message: 'The local data is not found',
          );
        }

        if (onSuccess != null) return onSuccess(data);
        return data;
      },
    );
  }

  /// Save data [value] to [Box] with data key from [dataKey]. If nay error
  /// about cahe, throw [GeneralCacheException].
  ///
  /// Params:
  /// - [cache] `required` an instance of [Hive]
  /// - [boxKey] `required` [Box] of [Hive]
  /// - [dataKey] `required` key to get the value from [Box]
  ///
  /// Examples
  ///
  /// ```dart
  /// // Example 1
  /// setCache<String>(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///   value: json.encode({'key': 'value'}),
  ///  );
  ///
  /// // Example 2:
  /// setCache<bool>(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///   value: true,
  ///  );
  ///
  /// ```
  Future<T?> setCache<T>(
    HiveInterface cache, {
    required String boxKey,
    required String dataKey,
    required T value,
    CacheResponseCallBack<T?>? onSuccess,
  }) async {
    return _callWithErrorHandler<T?>(
      cache: cache,
      boxKey: boxKey,
      action: (box) async {
        await box.put(dataKey, value);
        if (onSuccess != null) return onSuccess(box.get(dataKey));

        return box.get(dataKey);
      },
    );
  }

  /// Delete data from box [boxKey] with key from [dataKey]. If nay error
  /// about cahe, throw [GeneralCacheException].
  ///
  /// Params:
  /// - [cache] `required` an instance of [Hive]
  /// - [boxKey] `required` [Box] of [Hive]
  /// - [dataKey] `required` key to get the value from [Box]
  ///
  /// Examples
  ///
  /// ```dart
  /// // Example 1
  /// deleteCache(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///   onSuccess: (isSuccess) => isSuccess,
  ///  );
  ///
  /// // Example 2:
  /// deleteCache(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///  );
  ///
  Future<bool> deleteCache(
    HiveInterface cache, {
    required String boxKey,
    required String dataKey,
    CacheResponseCallBack<bool>? onSuccess,
  }) async {
    return _callWithErrorHandler<bool>(
      cache: cache,
      boxKey: boxKey,
      action: (box) async {
        await box.delete(dataKey);
        if (onSuccess != null) return onSuccess(true);

        return true;
      },
    );
  }

  // get box from hive
  Future<Box<T>> _getBox<T>(HiveInterface cache, String boxKey) async {
    if (!cache.isBoxOpen(boxKey)) {
      return cache.openBox<T>(boxKey);
    }

    return cache.box<T>(boxKey);
  }

  // call action with error handler
  Future<T> _callWithErrorHandler<T>({
    required _SuccessResponseBoxCallBack<T> action,
    required HiveInterface cache,
    required String boxKey,
  }) async {
    try {
      final box = await _getBox<T>(cache, boxKey);

      return await action(box);
    } on ErrorException catch (_) {
      rethrow;
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace, error: stackTrace);
      if (e is HiveError) {
        throw GeneralCacheException(message: e.message);
      } else {
        throw ErrorCodeException(message: e.toString());
      }
    }
  }
}
