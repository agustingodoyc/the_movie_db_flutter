import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/card_title.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_page/column_card/card_text.dart';

import '../../../utils/mock_entity.dart';

void main() {
  testWidgets(
    'CardText Test',
    (WidgetTester tester) async {
      final mockPayload = MockEntity.moviePreview;
      const mockColorScheme = ColorScheme.light();
      await tester.pumpWidget(
        MaterialApp(
          home: CardText(
            payload: mockPayload,
            imageColorScheme: mockColorScheme,
          ),
        ),
      );

      expect(
        find.byType((CardTitle)),
        findsOneWidget,
      );
      expect(
        find.text(mockPayload.movie.overview!),
        findsOneWidget,
      );
    },
  );
}
