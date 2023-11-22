import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/core/utils/enums/page_enum.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/app_drawer/app_drawer.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/app_drawer/drawer_page.dart';
import 'package:the_movie_db_flutter/src/presentation/widgets/general/app_drawer/drawer_title.dart';

void main() {
  testWidgets(
    'AppDrawer test',
    (WidgetTester tester) async {
      final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            key: key,
            appBar: AppBar(),
            drawer: const AppDrawer(),
          ),
        ),
      );
      key.currentState?.openDrawer();
      await tester.pump();
      expect(
        find.byType((DrawerTitle)),
        findsOneWidget,
      );
      expect(
        find.byType((DrawerPage)),
        findsNWidgets(PageEnum.values.length),
      );
    },
  );
}
