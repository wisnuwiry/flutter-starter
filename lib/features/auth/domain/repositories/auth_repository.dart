import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/auth/auth.dart';
import 'package:hive/hive.dart';

/// {@template auth_repository}
/// A repository which manages the auth
/// {@endtemplate}
abstract class AuthRepository {
  /// Request login, when successfully return [User]
  /// if there is an error will throw an error [ErrorException].
  ///
  /// Params:
  /// - [body] a payload body to sending to server
  Future<User> login(Map<String, dynamic> body);

  /// Request logout and clear all cache in this app
  /// return [bool] with value `true` on success
  /// if there is an error will throw an error [ErrorException].
  Future<bool> logout();
}

/// {@template auth_repository_impl}
/// A repository implementation from AuthRepository
/// {@endtemplate}
class AuthRepositoryImpl
    with ServiceCacheHandlerMixin, ServiceNetworkHandlerMixin
    implements AuthRepository {
  const AuthRepositoryImpl({
    required this.httpClient,
    required this.cacheClient,
  });

  final Dio httpClient;
  final HiveInterface cacheClient;

  @override
  Future<User> login(Map<String, dynamic> body) async {
    return post<User>(
      '/login',
      httpClient: httpClient,
      payload: body,
      onSuccess: (response) async {
        const user = User(
          email: 'testingonly@gmail.com',
          name: 'Fake Name',
        );
        await saveUser(user);

        return user;
      },
    );
  }

  @override
  Future<bool> logout() {
    return deleteCache(
      cacheClient,
      boxKey: AuthCacheKeys.userCacheKey,
      dataKey: AuthCacheKeys.userCacheKey,
      onSuccess: (result) async => result,
    );
  }

  Future<bool> saveUser(User user) async {
    final result = await setCache<String?>(
      cacheClient,
      boxKey: AuthCacheKeys.userCacheKey,
      dataKey: AuthCacheKeys.userCacheKey,
      value: jsonEncode(user.toJson()),
      onSuccess: (result) async => result,
    );

    return result != null;
  }
}
