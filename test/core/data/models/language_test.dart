import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/utils.dart';

void main() {
  group('core/data/models/', () {
    final tLanguage = Language.fromJson(jsonFixture('language.json'));
    test('Should parse json correctly', () async {
      expect(tLanguage.name, 'Indonesia');
      expect(tLanguage.code, 'id');
    });

    test('Should serialize to json correctly', () async {
      final languageJson = tLanguage.toJson();

      expect(languageJson['name'], tLanguage.name);
      expect(languageJson['code'], tLanguage.code);
    });

    test('Should copyWith correctly', () async {
      final tLanguageCopy = tLanguage.copyWith(
        name: 'English',
        code: 'en',
      );

      expect(tLanguageCopy.name, 'English');
      expect(tLanguageCopy.code, 'en');
    });

    test('Should copyWith with empty changed is correctly', () {
      final actual = tLanguage.copyWith();

      expect(actual, tLanguage);
    });

    test('Shoud Language compary with == is correctly', () {
      expect(tLanguage, tLanguage);
      expect(tLanguage == tLanguage, true);

      expect(tLanguage.props, [tLanguage.code, tLanguage.name]);
    });

    test('Should Language toJson correctly', () async {
      expect(tLanguage.toJson(), jsonFixture('language.json'));
    });
  });
}
