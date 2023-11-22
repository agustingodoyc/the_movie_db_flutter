import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/movie_title.dart';

void main() {
  testWidgets(
    'MovieTitle Test',
    (WidgetTester tester) async {
      const testText = 'testText';
      await tester.pumpWidget(
        const MaterialApp(
          home: MovieTitle(
            title: testText,
            releaseDate: testText,
          ),
        ),
      );

      expect(
        find.byType((RichText)),
        findsOneWidget,
      );
    },
  );
}
