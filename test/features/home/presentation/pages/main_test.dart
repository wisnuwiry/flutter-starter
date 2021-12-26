import 'package:flutter/material.dart';
import 'package:flutter_starter/features/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  group('features/home/presentation/pages/', () {
    testWidgets('Render MainPage', (tester) async {
      await tester.pumpApp(const MainPage());

      await tester.pumpAndSettle();

      // verify component
      expect(find.byType(Scaffold), findsWidgets);
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      await tester.tap(find.byIcon(Icons.home).last);
    });
  });
}
