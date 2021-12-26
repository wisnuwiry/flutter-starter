import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_starter/app/flavor.dart';
import 'package:flutter_starter/app/locator.dart';
import 'package:flutter_starter/app/runner.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.flavor = Flavor.prod;

  await setupLocator();

  runZonedGuarded(
    runnerApp,
    (error, stackTrace) => log(
      error.toString(),
      name: 'ERROR',
      stackTrace: stackTrace,
    ),
  );
}
