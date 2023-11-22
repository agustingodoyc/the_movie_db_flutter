import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/core/utils/enums/page_enum.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/home/movies_row/movies_row.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/home/page_preview.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/home/preview_header/preview_header.dart';

void main() {
  testWidgets(
    'PagePreview Test',
        (WidgetTester tester) async {
      const mockPage = PageEnum.popular;
      await tester.pumpWidget(
        const MaterialApp(
          home: PagePreview(page: mockPage),
        ),
      );

      expect(
        find.byType((PreviewHeader)),
        findsOneWidget,
      );
      expect(
        find.byType((MoviesRow)),
        findsOneWidget,
      );
    },
  );
}
