import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/data/models/', () {
    test('Should PaginationData correctly', () {
      final actual = PaginationData<List<String>, bool>(
        data: ['Hello', 'World'],
        meta: true,
      );

      expect(actual.data, isA<List<String>>());
      expect(actual.meta, isA<bool>());
    });
  });
}
