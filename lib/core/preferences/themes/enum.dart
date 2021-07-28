import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core.dart';

enum AppTheme { light, dark }

AppTheme? appThemeFromString(String? value) {
  switch (value) {
    case 'light':
      return AppTheme.light;
    case 'dark':
      return AppTheme.dark;
    default:
      return null;
  }
}

extension AppThemeX on AppTheme {
  String toText() {
    return describeEnum(this);
  }

  ThemeData toThemeData() {
    switch (this) {
      case AppTheme.dark:
        return DarkTheme(Colors.blue).toTheme;
      case AppTheme.light:
        return LightTheme(Colors.blue).toTheme;
      default:
        return LightTheme(Colors.blue).toTheme;
    }
  }
}
