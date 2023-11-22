import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/poster_image.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/movie_header.dart';

void main() {
  testWidgets(
    'MovieHeader Test',
    (WidgetTester tester) async {
      const test = 'test';
      await tester.pumpWidget(
        const MaterialApp(
          home: MovieHeader(
            backdropUrl: test,
            posterUrl: test,
          ),
        ),
      );

      expect(
        find.byType((CachedNetworkImage)),
        findsNWidgets(2),
      );
      expect(
        find.byType((Container)),
        findsOneWidget,
      );
      expect(
        find.byType((PosterImage)),
        findsOneWidget,
      );
    },
  );
}
