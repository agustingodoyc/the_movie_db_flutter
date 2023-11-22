import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/image_navigator.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/poster_image.dart';

import '../../utils/mock_entity.dart';

void main() {
  testWidgets(
    'ImageNavigator Test',
    (WidgetTester tester) async {
      final mockMoviePreview = MockEntity.moviePreview;
      await tester.pumpWidget(
        MaterialApp(
          home: ImageNavigator(
            payload: mockMoviePreview,
          ),
        ),
      );

      expect(
        find.byType((PosterImage)),
        findsOneWidget,
      );
    },
  );
}
