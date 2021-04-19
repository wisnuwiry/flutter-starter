import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';

import '../core/core.dart';
import '../features/posts/posts.dart';
import '../features/settings/settings.dart';
import 'config.dart';
import 'flavor.dart';

// ignore_for_file: cascade_invocations
final getIt = GetIt.instance;
Future<void> setupLocator() async {
  await _setupCore();

  // |+-----------------------------------------------------------------------+|
  // |+                               FEATURES                                +|
  // |+-----------------------------------------------------------------------+|

  // ---------------------------------- AUTH -----------------------------------

  // Data

  // Domain

  // Presentation

  // -------------------------------- END AUTH ---------------------------------

  // ---------------------------------- POST -----------------------------------

  // Data
  getIt.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(getIt()));
  getIt.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(getIt()));

  getIt.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  // Domain
  getIt.registerLazySingleton(() => GetPostsUseCase(getIt()));

  // Presentation
  getIt.registerFactory(() => PostsBloc(useCase: getIt()));

  // -------------------------------- END POST ---------------------------------

  // -------------------------------- SETTINGS ---------------------------------

  // Data
  getIt.registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSourceImpl(getIt()));
  getIt.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(
        localDataSource: getIt(),
      ));

  // Domain
  getIt.registerLazySingleton(() => GetLanguageSettingUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSettingsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetThemeSettingUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveLanguageSettingUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveSettingsUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveThemeSettingUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSupportedLanguageUseCase());

  // Presentation
  getIt.registerFactory(() => LanguageBloc(
        getLanguageSetting: getIt(),
        saveLanguageSetting: getIt(),
        getSupportedLanguage: getIt(),
      ));
  getIt.registerFactory(() => ThemeBloc(
        getThemeSetting: getIt(),
        saveThemeSetting: getIt(),
      ));

  // ------------------------------ END SETTINGS -------------------------------

  // |+-----------------------------------------------------------------------+|
  // |+                             END FEATURES                              +|
  // |+-----------------------------------------------------------------------+|
}

Future<void> _setupCore() async {
  EquatableConfig.stringify = AppConfig.autoStringifyEquatable;

  // External
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        baseUrl: F.flavor.url,
      )
      ..interceptors.add(LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      )),
  );
  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
  }
  getIt.registerLazySingleton<HiveInterface>(() => Hive);

  // Core
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );

  Bloc.observer = AppBlocObserver();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
}

extension _BaseUrlFlavor on Flavor {
  String get url {
    switch (this) {
      case Flavor.dev:
        return AppConfig.baseURLDev;
      case Flavor.staging:
        return AppConfig.baseURLStg;
      case Flavor.prod:
        return AppConfig.baseURL;
      default:
        throw Exception('Flavor type can\'t null by default');
    }
  }
}
