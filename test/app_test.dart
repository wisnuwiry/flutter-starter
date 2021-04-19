import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_works/app/app.dart';
import 'package:flutter_works/features/posts/posts.dart';

void main() {
  group('App', () {
    testWidgets('renders PostsPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(PostsPage), findsOneWidget);
    });
  });
}
