import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_starter/core/core.dart';

/// Callback when the request is success.
typedef ApiResponseCallBack<T, R> = Future<T> Function(R value);

/// {@template service_network_handler_mixin}
/// Mixin to handle the network API request.
/// {@endtemplate}
mixin ServiceNetworkHandlerMixin {
  /// Handle method to make http **GET** request
  ///
  /// Params:
  /// - [url] `required` url to request, ex: `/auth/login`
  /// - [httpClient] `required` an instance of [Dio]
  /// - [onSuccess] `required` callback when the request is success
  /// - [options] Optional parameters when request API
  /// - [queryParameters] Optional for add a query in URL
  ///
  /// Examples
  ///
  /// ```dart
  ///  get(
  ///     '/profile',
  ///     httpClient: httpClient,
  ///     onSuccess: (response) async {
  ///       return Profile.fromJson(response);
  ///     },
  ///   );
  /// ```
  Future<T> get<T>(
    String url, {
    required Dio httpClient,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) {
    return _callWithErrorHandler<T>(
      _callToNetwork(
        url,
        httpClient: httpClient,
        method: 'GET',
        onSuccess: onSuccess,
        options: options,
        queryParameters: queryParameters,
      ),
    );
  }

  /// Handle method to make http **POST** request
  ///
  /// Params:
  /// - [url] `required` url to request, ex: `/auth/login`
  /// - [httpClient] `required` an instance of [Dio]
  /// - [payload] `required` and nullable payload data to request
  /// - [onSuccess] `required` callback when the request is success
  /// - [options] Optional parameters when request API
  /// - [queryParameters] Optional for add a query in URL
  ///
  /// Examples
  ///
  /// ```dart
  /// return post<Profile>(
  ///     '/auth/login',
  ///     httpClient: httpClient,
  ///     payload: {
  ///       'email': email,
  ///       'password': password,
  ///     },
  ///     onSuccess: (response) async {
  ///       return Profile.fromJson(response);
  ///     },
  ///   );
  /// ```
  Future<T> post<T>(
    String url, {
    required Dio httpClient,
    required Object? payload,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) {
    return _callWithErrorHandler<T>(
      _callToNetwork(
        url,
        httpClient: httpClient,
        method: 'POST',
        onSuccess: onSuccess,
        options: options,
        payload: payload,
        queryParameters: queryParameters,
      ),
    );
  }

  /// Handle method to make http **PUT** request
  ///
  /// Params:
  /// - [url] `required` url to request, ex: `/auth/login`
  /// - [httpClient] `required` an instance of [Dio]
  /// - [payload] `required` and nullable payload data to request
  /// - [onSuccess] `required` callback when the request is success
  /// - [options] Optional parameters when request API
  /// - [queryParameters] Optional for add a query in URL
  ///
  /// Examples
  ///
  /// ```dart
  /// return put<Profile>(
  ///     '/profile/update',
  ///     httpClient: httpClient,
  ///     payload: {
  ///       'email': email,
  ///       'password': password,
  ///     },
  ///     onSuccess: (response) async {
  ///       return Profile.fromJson(response);
  ///     },
  ///   );
  /// ```
  Future<T> put<T>(
    String url, {
    required Dio httpClient,
    required Object? payload,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) {
    return _callWithErrorHandler<T>(
      _callToNetwork(
        url,
        httpClient: httpClient,
        method: 'PUT',
        onSuccess: onSuccess,
        options: options,
        payload: payload,
        queryParameters: queryParameters,
      ),
    );
  }

  /// Handle method to make http **PATH** request
  ///
  /// Params:
  /// - [url] `required` url to request, ex: `/auth/login`
  /// - [httpClient] `required` an instance of [Dio]
  /// - [payload] `required` and nullable payload data to request
  /// - [onSuccess] `required` callback when the request is success
  /// - [options] Optional parameters when request API
  /// - [queryParameters] Optional for add a query in URL
  ///
  /// Examples
  ///
  /// ```dart
  /// return patch<Profile>(
  ///     '/profile/update',
  ///     httpClient: httpClient,
  ///     payload: {
  ///       'email': email,
  ///       'password': password,
  ///     },
  ///     onSuccess: (response) async {
  ///       return Profile.fromJson(response);
  ///     },
  ///   );
  /// ```
  Future<T> patch<T>(
    String url, {
    required Dio httpClient,
    required Object? payload,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) {
    return _callWithErrorHandler<T>(
      _callToNetwork(
        url,
        httpClient: httpClient,
        method: 'PATCH',
        onSuccess: onSuccess,
        options: options,
        payload: payload,
        queryParameters: queryParameters,
      ),
    );
  }

  /// Handle method to make http **DELETE** request
  ///
  /// Params:
  /// - [url] `required` url to request, ex: `/auth/login`
  /// - [httpClient] `required` an instance of [Dio]
  /// - [payload] `required` and nullable payload data to request
  /// - [onSuccess] `required` callback when the request is success
  /// - [options] Optional parameters when request API
  /// - [queryParameters] Optional for add a query in URL
  ///
  /// Examples
  ///
  /// ```dart
  /// return delete<bool>(
  ///     '/profile/1/delete',
  ///     httpClient: httpClient,
  ///     payload: {},
  ///     onSuccess: (response) async {
  ///       return true;
  ///     },
  ///   );
  /// ```
  Future<T> delete<T>(
    String url, {
    required Dio httpClient,
    required Object? payload,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) {
    return _callWithErrorHandler<T>(
      _callToNetwork(
        url,
        httpClient: httpClient,
        method: 'DELETE',
        onSuccess: onSuccess,
        options: options,
        payload: payload,
      ),
    );
  }

  // calling to netowrk and mapping to httpClient by httpMethod
  Future<T> _callToNetwork<T>(
    String url, {
    required Dio httpClient,
    Object? payload,
    required String method,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    late Response response;

    switch (method.toUpperCase().trim()) {
      case 'GET':
        response = await httpClient.get<dynamic>(
          url,
          options: options,
          queryParameters: queryParameters,
        );
        break;
      case 'POST':
        response = await httpClient.post<dynamic>(
          url,
          data: payload,
          options: options,
          queryParameters: queryParameters,
        );
        break;
      case 'PUT':
        response = await httpClient.put<dynamic>(
          url,
          data: payload,
          options: options,
          queryParameters: queryParameters,
        );
        break;
      case 'PATCH':
        response = await httpClient.patch<dynamic>(
          url,
          data: payload,
          options: options,
          queryParameters: queryParameters,
        );
        break;
      case 'DELETE':
        response = await httpClient.delete<dynamic>(
          url,
          data: payload,
          options: options,
          queryParameters: queryParameters,
        );
        break;
      default:
        throw UnsupportedError('Method $method is not supported');
    }

    return onSuccess.call(response);
  }

  // running action and returning data when success, otherwise throw error
  Future<T> _callWithErrorHandler<T>(Future<T> action) async {
    try {
      return await action;
    } on DioError catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace, error: stackTrace);
      throw e.toServerException();
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace, error: stackTrace);
      throw ErrorCodeException(message: e.toString());
    }
  }
}
