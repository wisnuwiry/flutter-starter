import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/data/', () {
    test('Should get all languages is valid', () {
      final actual = LanguagesData.data;

      expect(actual, isNotNull);
      expect(actual, isNotEmpty);
      expect(actual, isA<List<Language>>());
    });

    test('Should language code correctly with only have 2 chars', () async {
      final data = LanguagesData.data;

      for (final lang in data) {
        expect(lang.code.length, 2);
      }
    });
  });
}
