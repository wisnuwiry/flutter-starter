import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/usecases/', () {
    group('PaginateParams', () {
      const tParams = PaginateParams(page: 1, perPage: 10);

      test('Should compare object PaginateParams is correctly', () async {
        expect(tParams, tParams);
        expect(tParams == tParams, true);
      });

      test('Should toString object PaginateParams is correctly', () async {
        expect(tParams.toString(), 'PaginateParams(1, 10)');
      });
    });

    group('SearchParams', () {
      const tParams = SearchParams('google');

      test('Should compare object SearchParams is correctly', () async {
        expect(tParams, tParams);
        expect(tParams == tParams, true);
      });

      test('Should toString object SearchParams is correctly', () async {
        expect(tParams.toString(), 'SearchParams(google)');
      });
    });

    group('SearchPaginateParams', () {
      const tParams =
          SearchPaginateParams(page: 1, perPage: 10, query: 'google');

      test('Should compare object SearchPaginateParams is correctly', () async {
        expect(tParams, tParams);
        expect(tParams == tParams, true);
      });

      test('Should toString object SearchPaginateParams is correctly',
          () async {
        expect(tParams.toString(), 'SearchPaginateParams(google, 1, 10)');
      });
    });
  });
}
