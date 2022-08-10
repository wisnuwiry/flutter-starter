import 'dart:convert';

import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/auth/auth.dart';
import 'package:hive/hive.dart';

/// {@template user_repository}
/// A repository which manages the User
/// {@endtemplate}
abstract class UserRepository {
  /// Request get current user
  /// return [User] on success
  /// if there is an error will throw an error [ErrorException].
  Future<User> getUser();
}

/// {@template user_repository_impl}
/// A repository implementation from UserRepository
/// {@endtemplate}
class UserRepositoryImpl
    with ServiceCacheHandlerMixin
    implements UserRepository {
  const UserRepositoryImpl({required this.cacheClient});

  final HiveInterface cacheClient;

  @override
  Future<User> getUser() async {
    final result = await getCache<String>(
      cacheClient,
      boxKey: AuthCacheKeys.userCacheKey,
      dataKey: AuthCacheKeys.userCacheKey,
      onSuccess: (data) async => data,
    );

    if (result.isEmpty) {
      throw const NotFoundCacheException(
        message: 'Cache of User is not found in this device',
      );
    }

    return User.fromJson(json.decode(result) as Map<String, dynamic>);
  }
}
