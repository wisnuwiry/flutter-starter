import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/app/app.dart';
import 'package:flutter_starter/core/core.dart';

void runnerApp() {
  runZonedGuarded(
    () => BlocOverrides.runZoned(
      () => runApp(const App()),
      blocObserver: AppBlocObserver(),
    ),
    (error, stackTrace) {
      // Implement Logging Error in this body,
      // like Sentry of Firebase Crashlytics
      log(
        error.toString(),
        name: 'LOG',
        stackTrace: stackTrace,
      );
    },
  );
}
