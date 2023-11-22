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
        return _buildHomeRoute(settings);
      case NavigationRoutes.page:
        return _buildMoviesPageRoute(settings);
      case NavigationRoutes.movie:
        return _buildMovieDetailsRoute(settings);
      default:
        return _buildErrorRoute(settings);
    }
  }

  static MaterialPageRoute _buildHomeRoute(RouteSettings settings) =>
      MaterialPageRoute(
        builder: (_) => const Home(),
        settings: settings,
      );

  static MaterialPageRoute _buildMoviesPageRoute(RouteSettings settings) {
    if (settings.arguments is PageEnum) {
      final pageEnum = settings.arguments as PageEnum;
      return MaterialPageRoute(
        builder: (_) => MoviesPage(pageEnum: pageEnum),
        settings: settings,
      );
    } else {
      return _buildErrorRoute(settings);
    }
  }

  static MaterialPageRoute _buildMovieDetailsRoute(RouteSettings settings) {
    if (settings.arguments is MoviePreview) {
      final moviePreview = settings.arguments as MoviePreview;
      return MaterialPageRoute(
        builder: (_) => MovieDetails(moviePreview: moviePreview),
        settings: settings,
      );
    } else {
      return _buildErrorRoute(settings);
    }
  }

  static MaterialPageRoute _buildErrorRoute(RouteSettings settings) =>
      MaterialPageRoute(
        builder: (_) => const ErrorPage(),
        settings: settings,
      );
}
