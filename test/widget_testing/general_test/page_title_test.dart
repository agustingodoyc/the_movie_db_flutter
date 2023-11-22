import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/page_title.dart';

void main() {

  testWidgets(
    'PageTitle Test',
        (WidgetTester tester) async {
      const mockTitle = 'Mock Title';
      await tester.pumpWidget(
        const MaterialApp(
          home: PageTitle(title: mockTitle),
        ),
      );

      expect(
        find.text(mockTitle),
        findsOneWidget,
      );
    },
  );
}
