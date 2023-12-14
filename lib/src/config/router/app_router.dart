// Package imports
import 'package:flutter/material.dart';

// Local imports
import '../../core/utils/index.dart';
import '../../data/models/movie_preview.dart';
import '../../presentation/views/index.dart';

class AppRouter {
  static const String initialRoute = NavigationRoutes.home;

  // Method to generate routes based on the route name
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationRoutes.home:
        return _buildRoute(
          settings,
          const Home(),
        );
      case NavigationRoutes.page:
        return _buildMoviesPageRoute(settings);
      case NavigationRoutes.movie:
        return _buildMovieDetailsRoute(settings);
      default:
        return _buildRoute(
          settings,
          const ErrorPage(),
        );
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings,
    Widget page,
  ) =>
      MaterialPageRoute(
        builder: (_) => page,
        settings: settings,
      );

  static MaterialPageRoute _buildMoviesPageRoute(RouteSettings settings) {
    if (_isValidPageEnum(settings.arguments)) {
      return _buildRoute(
        settings,
        MoviesPage(pageEnum: settings.arguments as PageEnum),
      );
    } else {
      return _buildRoute(
        settings,
        const ErrorPage(),
      );
    }
  }

  static bool _isValidPageEnum(Object? argument) => argument is PageEnum;

  static MaterialPageRoute _buildMovieDetailsRoute(RouteSettings settings) {
    if (_isValidMoviePreview(settings.arguments)) {
      return _buildRoute(
        settings,
        MovieDetails(moviePreview: settings.arguments as MoviePreview),
      );
    } else {
      return _buildRoute(
        settings,
        const ErrorPage(),
      );
    }
  }

  static bool _isValidMoviePreview(Object? argument) =>
      argument is MoviePreview;
}
