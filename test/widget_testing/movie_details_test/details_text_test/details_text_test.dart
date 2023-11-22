import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/details_text/details_box.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/details_text/details_text.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/details_text/movie_overview.dart';

import '../../../utils/mock_entity.dart';

void main() {
  testWidgets(
    'DetailsText Test',
    (WidgetTester tester) async {
      final mockPayload = MockEntity.moviePreview;
      await tester.pumpWidget(
        MaterialApp(
          home: DetailsText(payload: mockPayload),
        ),
      );

      expect(
        find.byType((DetailsBox)),
        findsOneWidget,
      );
      expect(
        find.byType((MovieOverview)),
        findsOneWidget,
      );
    },
  );
}
