import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_challenge/features/app/app.dart';
import 'package:pokemon_challenge/features/home/view/home_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
