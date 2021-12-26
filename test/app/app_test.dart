import 'package:flutter_starter/app/app.dart';
import 'package:flutter_starter/features/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  setUp(() async {
    await setupTestLocator();
  });

  group('app/', () {
    testWidgets('Renders MainPage as Default Page', (tester) async {
      await tester.pumpApp(const App());

      await tester.pumpAndSettle();
      expect(find.byType(MainPage), findsWidgets);
    });
  });
}
