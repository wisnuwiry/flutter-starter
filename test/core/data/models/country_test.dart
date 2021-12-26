import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/utils.dart';

void main() {
  group('core/data/models/', () {
    final tCountry = Country.fromJson(jsonFixture('country.json'));
    test('Should parse json correctly', () async {
      expect(tCountry.name, 'Indonesia');
      expect(tCountry.code, 'ID');
      expect(tCountry.dialCode, '+62');
      expect(tCountry.flag, 'id.png');
    });

    test('Should serialize to json correctly', () async {
      final countryJson = tCountry.toJson();

      expect(countryJson['name'], tCountry.name);
      expect(countryJson['code'], tCountry.code);
      expect(countryJson['dial_code'], tCountry.dialCode);
      expect(countryJson['flag'], tCountry.flag);
    });

    test('Should copyWith correctly', () async {
      final tCountryCopy = tCountry.copyWith(
        name: 'United States',
        code: 'USA',
        dialCode: '+1',
        flag: 'us.png',
      );

      expect(tCountryCopy.name, 'United States');
      expect(tCountryCopy.code, 'USA');
      expect(tCountryCopy.dialCode, '+1');
      expect(tCountryCopy.flag, 'us.png');
    });

    test('Should copyWith with empty changed is correctly', () {
      final actual = tCountry.copyWith();

      expect(actual, tCountry);
    });

    test('Shoud Country compary with == is correctly', () {
      expect(tCountry, tCountry);
      expect(tCountry == tCountry, true);
    });

    test('Should Country toJson correctly', () async {
      expect(tCountry.toJson(), jsonFixture('country.json'));
    });
  });
}
