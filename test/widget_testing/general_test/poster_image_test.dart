import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/poster_image.dart';

void main() {
  testWidgets(
    'ImageNavigator Test',
    (WidgetTester tester) async {
      const mockImageUrl = 'mockImageUrl';
      await tester.pumpWidget(
        const MaterialApp(
          home: PosterImage(
            imageUrl: mockImageUrl,
          ),
        ),
      );

      expect(
        find.byType((CachedNetworkImage)),
        findsOneWidget,
      );
    },
  );
}
