import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/config/router/app_router.dart';
import 'package:the_movie_db_flutter/src/core/utils/enums/page_enum.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/home/preview_header/page_navigator.dart';

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
    'PageNavigator UI Test',
    (WidgetTester tester) async {
      const mockPage = PageEnum.popular;
      await tester.pumpWidget(
        const MaterialApp(
          home: PageNavigator(page: mockPage),
        ),
      );

      expect(
        find.byType((Icon)),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'PageNavigator Navigation Test',
    (WidgetTester tester) async {
      const mockPage = PageEnum.popular;
      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          navigatorObservers: [mockObserver],
          home: const PageNavigator(page: mockPage),
        ),
      );

      await tester.tap(find.byType((Icon)));

      await tester.pumpAndSettle();

      verify(() => mockObserver.didPush(any(), any())).called(2);
      // The first call is the normal flow of the app, the second is the
      // expected navigation
    },
  );
}
