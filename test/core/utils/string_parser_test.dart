import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/utils/', () {
    test('Should stringParse from dynamic value correctly', () {
      final actual1 = StringParser.parse('123');
      final actual2 = StringParser.parse(2323983489348);
      final actual3 = StringParser.parse(0034934.034);
      final actual4 = StringParser.parse(null);
      final actual5 = StringParser.parse(null, fallbackValue: 'fallback');

      expect(actual1, isA<String>());
      expect(actual1, '123');
      expect(actual2, '2323983489348');
      expect(actual3, '34934.034');
      expect(actual4, '');
      expect(actual5, 'fallback');
    });

    test('Should tryStringParse return null when incorrectly', () {
      final actual = StringParser.tryParse(null);

      expect(actual, null);
    });
  });
}
