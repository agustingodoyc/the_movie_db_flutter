import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/image_navigator.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/vote_average.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/home/movies_row/row_card/card_stack.dart';

import '../../../../utils/mock_entity.dart';

void main() {
  testWidgets(
    'CardStack Test',
    (WidgetTester tester) async {
      final mockMoviePreview = MockEntity.moviePreview;
      await tester.pumpWidget(
        MaterialApp(
          home: CardStack(payload: mockMoviePreview),
        ),
      );

      expect(
        find.byType((ImageNavigator)),
        findsOneWidget,
      );
      expect(
        find.byType((VoteAverage)),
        findsOneWidget,
      );
    },
  );
}
