import '../../data_models/movie.dart';

abstract class IMoviesRepository {
  Future<List<Movie>> fetchMovies();
}
