import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'app/flavor.dart';
import 'app/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.flavor = Flavor.dev;

  await setupLocator();

  runZonedGuarded(
    () => runApp(App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
