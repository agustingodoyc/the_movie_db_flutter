import '../../data/models/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> fetchMovies();
}
