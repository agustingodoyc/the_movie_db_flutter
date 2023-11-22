import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/config/router/app_router.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/app_drawer/drawer_title.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}

void main() {
  late NavigatorObserver mockObserver;

  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  setUp(() {
    mockObserver = MockNavigatorObserver();
  });

  testWidgets(
    'DrawerTitle UI Test',
    (WidgetTester tester) async {
      const String test = 'Test';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DrawerTitle(title: test),
          ),
        ),
      );

      expect(
        find.text(test),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'DrawerTitle Navigation Test',
    (WidgetTester tester) async {
      const String test = 'Test';
      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          home: const Scaffold(
            body: DrawerTitle(title: test),
          ),
          navigatorObservers: [mockObserver],
        ),
      );

      await tester.tap(find.byType((Text)));

      await tester.pumpAndSettle();

      verify(() => mockObserver.didPush(any(), any())).called(2);
      // The first call is the normal flow of the app, the second is the
      // expected navigation
    },
  );
}
