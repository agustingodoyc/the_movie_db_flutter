import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/src/config/themes/app_theme.dart';

import 'src/config/router/app_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    return MaterialApp(
      routes: appRouter.routes,
      initialRoute: appRouter.initialRoute,
      theme: AppTheme.light,
    );
  }
}
