import 'package:flutter/material.dart';
import 'package:flutter_starter/features/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('features/home/presentation/pages/', () {
    testWidgets('Render HomePage', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      // verify component
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('Home Page'), findsOneWidget);
    });
  });
}
