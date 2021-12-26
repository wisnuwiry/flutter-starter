import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starter/app/config.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';

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

  // -------------------------------- SETTINGS ---------------------------------

  // Data
  getIt.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      localDataSource: getIt(),
    ),
  );

  // Domain
  getIt.registerLazySingleton(() => GetLanguageSettingUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSettingsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetThemeSettingUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveLanguageSettingUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveSettingsUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveThemeSettingUseCase(getIt()));
  getIt.registerLazySingleton(GetSupportedLanguageUseCase.new);
  getIt.registerLazySingleton(RecordErrorUseCase.new);

  // Presentation
  getIt.registerFactory(
    () => LanguageBloc(
      getLanguageSetting: getIt(),
      saveLanguageSetting: getIt(),
      getSupportedLanguage: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ThemeBloc(
      getThemeSetting: getIt(),
      saveThemeSetting: getIt(),
    ),
  );

  // ------------------------------ END SETTINGS -------------------------------

  // |+-----------------------------------------------------------------------+|
  // |+                             END FEATURES                              +|
  // |+-----------------------------------------------------------------------+|
}

Future<void> _setupCore() async {
  EquatableConfig.stringify = AppConfig.autoStringifyEquatable;

  // External
  getIt.registerLazySingleton(InternetConnectionChecker.new);
  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        baseUrl: AppConfig.baseUrl.value,
      )
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      ),
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
}
