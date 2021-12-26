import 'package:flutter_starter/app/config.dart';
import 'package:flutter_starter/app/flavor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('app/', () {
    group('Check value FlavorConfig from current Flavor', () {
      test('Dev', () {
        // arrange
        F.flavor = Flavor.dev;
        const expectResult = 'dev';

        // actual
        const result =
            FlavorConfig(dev: 'dev', prod: 'prod', staging: 'staging');

        // assert
        expect(result.value, expectResult);
      });

      test('Prod', () {
        // arrange
        F.flavor = Flavor.prod;
        const expectResult = 'prod';

        // actual
        const result =
            FlavorConfig(dev: 'dev', prod: 'prod', staging: 'staging');

        // assert
        expect(result.value, expectResult);
      });

      test('Staging', () {
        // arrange
        F.flavor = Flavor.staging;
        const expectResult = 'staging';

        // actual
        const result =
            FlavorConfig(dev: 'dev', prod: 'prod', staging: 'staging');

        // assert
        expect(result.value, expectResult);
      });
    });

    test(
        'Check Assertion when fallback is null, '
        'and in some flavor config is null', () {
      // arrange
      F.flavor = Flavor.dev;

      // assert
      expect(
        () {
          FlavorConfig(dev: 'dev', prod: null, staging: 'staging');
        },
        throwsAssertionError,
      );
    });

    test(
        'Check Assertion when fallback is null, '
        'and all flavor config is null', () {
      // arrange
      F.flavor = Flavor.staging;

      // assert
      expect(
        () {
          FlavorConfig(dev: null, prod: null, staging: null);
        },
        throwsAssertionError,
      );
    });

    test('Check use fallback value when value in current flavor is null', () {
      // arrange
      F.flavor = Flavor.prod;

      // actual
      const result = FlavorConfig(
        dev: null,
        prod: null,
        staging: null,
        fallback: 'fallback',
      );

      // assert
      expect(result.value, 'fallback');
    });
  });
}
