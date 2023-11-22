import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/card_title.dart';

import '../../utils/mock_entity.dart';

void main() {
  testWidgets(
    'CardTitle Test',
    (WidgetTester tester) async {
      final mockMoviePreview = MockEntity.moviePreview;
      final mockMovie = mockMoviePreview.movie;
      await tester.pumpWidget(
        MaterialApp(
          home: CardTitle(
            payload: mockMoviePreview,
          ),
        ),
      );

      expect(
        find.text(mockMovie.title!),
        findsOneWidget,
      );
      expect(
        find.text(mockMovie.releaseDate!),
        findsOneWidget,
      );
    },
  );
}
