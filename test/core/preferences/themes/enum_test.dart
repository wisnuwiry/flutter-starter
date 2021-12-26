import 'package:flutter/material.dart';
import 'package:flutter_starter/core/preferences/preferences.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/preferences/themes/', () {
    // arrange
    const tDark = AppTheme.dark;
    const tLight = AppTheme.light;

    test('Should get name enum in String correctly', () {
      // assert
      expect(tDark.toText(), 'dark');
      expect(tLight.toText(), 'light');
    });

    test('Should convert from AppTheme enum to ThemeData', () {
      expect(tDark.toThemeData(), isA<ThemeData>());
      expect(tLight.toThemeData(), isA<ThemeData>());

      expect(tDark.toThemeData().primaryColor, AppColors.primaryColor);
      expect(tLight.toThemeData().primaryColor, AppColors.primaryColor);
    });
  });
}
