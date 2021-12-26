import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/data/', () {
    test('Should get all country is valid', () {
      final actual = CountriesData.data;

      expect(actual, isNotNull);
      expect(actual, isNotEmpty);
      expect(actual, isA<List<Country>>());
    });

    test('Should generate flags assets URI correctly', () async {
      final data = CountriesData.data;

      for (final country in data) {
        expect(
          country.flag,
          'assets/images/flags/${country.code.toLowerCase()}.png',
        );
      }
    });
  });
}
