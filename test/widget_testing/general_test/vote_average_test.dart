import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/vote_average.dart';

void main() {
  testWidgets(
    'VoteAverage Test',
    (WidgetTester tester) async {
      const mockAverage = 0.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: VoteAverage(voteAverage: mockAverage),
        ),
      );

      expect(
        find.byType((CircularProgressIndicator)),
        findsOneWidget,
      );
      expect(
        find.text(mockAverage.toString()),
        findsOneWidget,
      );
    },
  );
}
