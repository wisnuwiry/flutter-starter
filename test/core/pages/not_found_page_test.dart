import 'package:flutter/material.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  setUp(() async {
    await setupTestLocator();
  });

  group('core/pages/', () {
    testWidgets('Render Not Found Page', (tester) async {
      // First render Page
      await tester.pumpApp(const NotFoundPage());

      // Check text 404 is available or not
      final text404 = find.text('404');
      expect(text404, findsOneWidget);

      // Cek button back to home
      final backButton = find.byKey(const Key('back_to_home_button_not_found'));
      expect(backButton, findsOneWidget);
    });
  });
}
