import 'package:flutter/material.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('core/preferences/ ', () {
    testWidgets(
        'Should equals Dimens.width/height with MediaQuery.of(context).size.width/height',
        (tester) async {
      final app = MediaQuery(
        data: const MediaQueryData(),
        child: Scaffold(
          body: Builder(
            builder: (context) {
              Future.microtask(() {
                final actualWidth = Dimens.width(context);
                final expectedWidth = MediaQuery.of(context).size.width;

                final actualHeight = Dimens.height(context);
                final expectedHeight = MediaQuery.of(context).size.height;

                expect(actualWidth, expectedWidth);
                expect(actualHeight, expectedHeight);
              });

              return const SizedBox();
            },
          ),
        ),
      );

      await tester.pumpApp(app);
    });
  });
}
