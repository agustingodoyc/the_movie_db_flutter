import '../../core/utils/constants/route_strings.dart';
import '../../presentation/views/movie_details.dart';
import '../../presentation/views/movie_list.dart';

class AppRouter {
  final routes = {
    RouteStrings.listRoute: (context) => const MovieList(),
    RouteStrings.movieRoute: (context) => const MovieDetails(),
  };

  final initialRoute = RouteStrings.listRoute;
}
