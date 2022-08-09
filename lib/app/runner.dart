import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/app/app.dart';
import 'package:flutter_starter/core/core.dart';

void runnerApp() {
  Bloc.observer = AppBlocObserver();

  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => error.recordError(stackTrace: stackTrace),
  );
}
