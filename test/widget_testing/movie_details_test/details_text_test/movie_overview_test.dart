import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/core/utils/constants/index.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/details_text/movie_overview.dart';

void main() {
  testWidgets(
    'MovieOverview Test',
    (WidgetTester tester) async {
      const mockOverview = 'mockOverview';
      await tester.pumpWidget(
        const MaterialApp(
          home: MovieOverview(overview: mockOverview),
        ),
      );

      expect(
        find.byType((Text)),
        findsNWidgets(2),
      );
      expect(
        find.text(AppTitles.overview),
        findsOneWidget,
      );
      expect(
        find.text(mockOverview),
        findsOneWidget,
      );
    },
  );
}
