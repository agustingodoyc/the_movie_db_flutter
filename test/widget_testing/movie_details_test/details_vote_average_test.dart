import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/core/utils/constants/index.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/vote_average.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/details_vote_average.dart';

void main() {
  testWidgets(
    'DetailsText Test',
    (WidgetTester tester) async {
      const num mockVoteAverage = 0.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: DetailsVoteAverage(voteAverage: mockVoteAverage),
        ),
      );

      expect(
        find.byType((VoteAverage)),
        findsOneWidget,
      );
      expect(
        find.text(AppTitles.voteAverage),
        findsOneWidget,
      );
    },
  );
}
