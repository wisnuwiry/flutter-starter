import 'package:flutter/material.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('core/extensions/ ', () {
    testWidgets('Should equals context.theme with Theme.of(context)',
        (tester) async {
      final app = Builder(
        builder: (context) {
          final actualResult = context.theme;
          final expectedResult = Theme.of(context);

          expect(actualResult, expectedResult);

          return const Scaffold();
        },
      );

      await tester.pumpApp(app);
    });
  });
}
