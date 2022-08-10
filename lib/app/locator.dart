import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter/app/config.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/auth/auth.dart';
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

  // Domain

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(httpClient: getIt(), cacheClient: getIt()),
  );

  // UseCase
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));

  // Presentation

  // -------------------------------- END AUTH ---------------------------------

  // |+-----------------------------------------------------------------------+|
  // |+                             END FEATURES                              +|
  // |+-----------------------------------------------------------------------+|
}

Future<void> _setupCore() async {
  EquatableConfig.stringify = AppConfig.autoStringifyEquatable;
  await dotenv.load(fileName: 'assets/.env');

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
