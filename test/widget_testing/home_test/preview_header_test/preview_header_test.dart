import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/core/utils/enums/page_enum.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/page_title.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/home/preview_header/page_navigator.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/home/preview_header/preview_header.dart';

void main() {
  testWidgets(
    'PreviewHeader Test',
        (WidgetTester tester) async {
      const mockPage = PageEnum.popular;
      await tester.pumpWidget(
        const MaterialApp(
          home: PreviewHeader(page: mockPage),
        ),
      );

      expect(
        find.byType((PageTitle)),
        findsOneWidget,
      );
      expect(
        find.byType((PageNavigator)),
        findsOneWidget,
      );
    },
  );
}
