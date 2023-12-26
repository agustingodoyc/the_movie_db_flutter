import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/like_button.dart';

void main() {
  testWidgets(
    'LikeButton Test',
    (WidgetTester tester) async {
      bool isFavorite = false;
      await tester.pumpWidget(
        MaterialApp(
          home: LikeButton(
            isFavorite: isFavorite,
            onTap: () {
              isFavorite = true;
            },
          ),
        ),
      );

      expect(
        find.byType((Icon)),
        findsOneWidget,
      );
    },
  );
}
