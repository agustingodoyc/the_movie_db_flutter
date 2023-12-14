import '../../core/utils/enums/endpoint_enum.dart';
import '../../core/utils/resources/data_state.dart';
import '../../domain/entities/genre_entity.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/i_database_repository.dart';
import '../datasources/local/database.dart';

class DatabaseRepository implements IDatabaseRepository {
  final AppDatabase database;

  DatabaseRepository(
    this.database,
  );

  @override
  Future<void> saveMovie(
    MovieEntity movie,
    EndpointEnum endpoint,
  ) async {
    MovieEntity? existingMovie = await getMovieById(movie);
    if (existingMovie != null) {
      if (!existingMovie.category.contains(endpoint.name)) {
        existingMovie.category.add(endpoint.name);
        await database.movieDao.insertMovie(existingMovie);
      }
    } else {
      await database.movieDao.insertMovie(movie);
    }
  }

  @override
  Future<DataState<List<MovieEntity>>> getSavedMovies(
    EndpointEnum endpoint,
  ) async {
    List<MovieEntity> savedMovies = [];
    try {
      savedMovies = await database.movieDao.findMovies(endpoint.name);
      return DataSuccess(data: savedMovies);
    } catch (e) {
      return DataFailed(error: Exception(e));
    }
  }

  @override
  Future<MovieEntity?> getMovieById(MovieEntity movie) {
    return database.movieDao.findMovieById(movie.id!);
  }

  @override
  Future<void> saveGenre(GenreEntity genre) async {
    GenreEntity? existingGenre = await getGenreById(genre);
    if (existingGenre != null) {
      await database.genreDao.insertGenre(genre);
    }
  }

  @override
  Future<DataState<List<GenreEntity>>> getSavedGenres() async {
    List<GenreEntity> savedGenres = [];
    try {
      savedGenres = await database.genreDao.findGenres();
      return DataSuccess(data: savedGenres);
    } catch (e) {
      return DataFailed(
        error: Exception(e),
      );
    }
  }

  @override
  Future<GenreEntity?> getGenreById(GenreEntity genre) {
    return database.genreDao.findGenreById(genre.id!);
  }
}
