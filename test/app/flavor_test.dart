import 'package:flutter_starter/app/flavor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('app/', () {
    test('Check when run with Flavor.dev valid or not', () {
      // arrange
      const expected = Flavor.dev;

      // actual
      F.flavor = Flavor.dev;

      // assert
      expect(F.flavor, expected);
    });

    test('Check when run with Flavor.staging valid or not', () {
      // arrange
      const expected = Flavor.staging;

      // actual
      F.flavor = Flavor.staging;

      // assert
      expect(F.flavor, expected);
    });

    test('Check when run with Flavor.prod valid or not', () {
      // arrange
      const expected = Flavor.prod;

      // actual
      F.flavor = Flavor.prod;

      // assert
      expect(F.flavor, expected);
    });
  });
}
