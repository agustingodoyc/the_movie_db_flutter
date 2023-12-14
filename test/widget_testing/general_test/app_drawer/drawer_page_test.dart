import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/utils/enums/page_enum.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/app_drawer/drawer_page.dart';

import '../../../utils/mock_route.dart';

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
    'DrawerPage UI Test',
    (WidgetTester tester) async {
      const PageEnum page = PageEnum.popular;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DrawerPage(page: page),
          ),
        ),
      );

      expect(
        find.text(page.pageTitle),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'DrawerPage Navigation Test',
    (WidgetTester tester) async {
      const PageEnum page = PageEnum.popular;
      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: MockRouter.mockRoute,
          navigatorObservers: [mockObserver],
          home: const Scaffold(
            body: DrawerPage(page: page),
          ),
        ),
      );

      await tester.tap(find.byType((Text)));

      await tester.pumpAndSettle();

      expect(find.text('Next Page'), findsOneWidget);
    },
  );
}
