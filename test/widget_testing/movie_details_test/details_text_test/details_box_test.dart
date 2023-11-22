import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/details_text/details_box.dart';

void main() {
  testWidgets(
    'DetailsBox Test',
    (WidgetTester tester) async {
      const test = 'test';
      await tester.pumpWidget(
        const MaterialApp(
          home: DetailsBox(
            releaseDate: test,
            genres: test,
          ),
        ),
      );

      expect(
        find.text(test),
        findsNWidgets(2),
      );
    },
  );
}
