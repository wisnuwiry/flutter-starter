import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/utils.dart';

void main() {
  group('features/settings/entities/', () {
    final tSettings = Settings.fromJson(jsonFixture('settings.json'));
    final tLanguage = Language.fromJson(jsonFixture('language.json'));
    const tTheme = AppTheme.light;

    test('Should parse json correctly', () async {
      expect(tSettings.language, tLanguage);
      expect(tSettings.theme, tTheme);
    });

    test('Should serialize to json correctly', () async {
      final languageJson = tSettings.toJson();

      expect(languageJson['language'], tLanguage.toJson());
      expect(languageJson['theme'], tTheme.toText());
    });

    test('Should copyWith correctly', () async {
      final tLanguageCopy = tLanguage.copyWith(name: 'United States');
      final tSettingsCopy = tSettings.copyWith(
        theme: AppTheme.dark,
        language: tLanguageCopy,
      );

      expect(tSettingsCopy.theme, AppTheme.dark);
      expect(tSettingsCopy.language, tLanguageCopy);
    });

    test('Shoud Settings compary with == is correctly', () {
      expect(tSettings, tSettings);
      expect(tSettings == tSettings, true);
    });

    test('Should Settings toJson correctly', () async {
      expect(tSettings.toJson(), jsonFixture('settings.json'));
    });
  });
}
