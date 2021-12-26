import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('core/utils/', () {
    group('int', () {
      test('Should intParse from dynamic value correctly', () {
        final actual1 = NumParser.intParse('123');
        final actual2 = NumParser.intParse(2323983489348);
        final actual3 = NumParser.intParse(0034934.034);
        final actual4 = NumParser.intParse('cfjf954');
        final actual5 = NumParser.intParse('testinvalid', fallbackValue: 90);

        expect(actual1, isA<int>());
        expect(actual1, 123);
        expect(actual2, 2323983489348);
        expect(actual3, 34934);
        expect(actual4, 0);
        expect(actual5, 90);
      });

      test('Should tryIntParse from dynamic value correctly', () {
        final actual1 = NumParser.tryIntParse('123');
        final actual2 = NumParser.tryIntParse(2323983489348);
        final actual3 = NumParser.tryIntParse(0034934.034);
        final actual4 = NumParser.tryIntParse('cfjf954');
        final actual5 = NumParser.tryIntParse('testinvalid');

        expect(actual1, isA<int>());
        expect(actual1, 123);
        expect(actual2, 2323983489348);
        expect(actual3, 34934);
        expect(actual4, null);
        expect(actual5, null);
      });
    });

    group('double', () {
      test('Should doubleParse from dynamic value correctly', () {
        final actual1 = NumParser.doubleParse('123');
        final actual2 = NumParser.doubleParse(232398348934898);
        final actual3 = NumParser.doubleParse(0034934.034);
        final actual4 = NumParser.doubleParse('cfjf954');
        final actual5 = NumParser.doubleParse('testinvalid', fallbackValue: 90);
        const tInt = 100;
        final actual6 = NumParser.doubleParse(tInt);

        expect(actual1, isA<double>());
        expect(actual1, 123.0);
        expect(actual2, 232398348934898.0);
        expect(actual3, 34934.034);
        expect(actual4, 0);
        expect(actual5, 90.0);
        expect(actual6, 100.0);
      });

      test('Should tryDoubleParse from dynamic value correctly', () {
        final actual1 = NumParser.tryDoubleParse('123');
        final actual2 = NumParser.tryDoubleParse(232398348934898);
        final actual3 = NumParser.tryDoubleParse(0034934.034);
        final actual4 = NumParser.tryDoubleParse('cfjf954');
        final actual5 = NumParser.tryDoubleParse('testinvalid');

        expect(actual1, isA<double>());
        expect(actual1, 123.0);
        expect(actual2, 232398348934898.0);
        expect(actual3, 34934.034);
        expect(actual4, null);
        expect(actual5, null);
      });
    });
  });
}
