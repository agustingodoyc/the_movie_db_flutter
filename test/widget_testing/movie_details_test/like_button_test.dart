import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/movie_details/like_button.dart';

void main() {
  testWidgets(
    'LikeButton Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LikeButton(),
        ),
      );

      expect(
        find.byType((Icon)),
        findsOneWidget,
      );
    },
  );
}
