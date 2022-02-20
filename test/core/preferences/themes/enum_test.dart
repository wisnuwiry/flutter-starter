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
      expect(tDark.toTheme(), isA<BaseTheme>());
      expect(tLight.toTheme(), isA<BaseTheme>());

      expect(tDark.toTheme().data.primaryColor, AppColors.primaryColor);
      expect(tLight.toTheme().data.primaryColor, AppColors.primaryColor);
    });
  });
}
