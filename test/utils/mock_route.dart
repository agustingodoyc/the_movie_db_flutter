import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/src/core/utils/index.dart';
import 'package:the_movie_db_flutter/src/presentation/index.dart';

class MockRouter {
  static Route<dynamic> mockRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const PageNavigator(page: PageEnum.topRated),
          settings: settings,
        );
      case NavigationRoutes.page:
        return MaterialPageRoute(
          builder: (_) => const Text('Next Page'),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(),
          settings: settings,
        );
    }
  }
}
