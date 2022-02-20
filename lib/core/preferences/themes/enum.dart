import 'package:flutter/foundation.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:json_annotation/json_annotation.dart';

enum AppTheme {
  @JsonValue('light')
  light,

  @JsonValue('dark')
  dark
}

extension AppThemeX on AppTheme {
  String toText() {
    return describeEnum(this);
  }

  BaseTheme toTheme() {
    switch (this) {
      case AppTheme.dark:
        return DarkTheme(AppColors.primaryColor);
      case AppTheme.light:
        return LightTheme(AppColors.primaryColor);
    }
  }
}
