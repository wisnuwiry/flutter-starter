import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_starter/app/locator.dart';
import 'package:flutter_test/src/deprecated.dart';

Future setupTestLocator() async {
  _setupMockPathProvider();

  await setupLocator();
}

void _setupMockPathProvider() {
  var channelName = '';
  if (Platform.isMacOS) {
    channelName = 'plugins.flutter.io/path_provider_macos';
  } else if (Platform.isLinux) {
    channelName = 'plugins.flutter.io/path_provider_linux';
  } else if (Platform.isWindows) {
    channelName = 'plugins.flutter.io/path_provider_windows';
  } else {
    channelName = 'plugins.flutter.io/path_provider';
  }

  final channel = MethodChannel(channelName);

  // ignore: cascade_invocations
  channel.setMockMethodCallHandler((MethodCall methodCall) async => '.');
}
