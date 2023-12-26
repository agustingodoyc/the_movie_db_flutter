import '../../core/utils/index.dart';
import '../../domain/index.dart';
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
    await database.movieDao.insertMovie(movie);
  }

  @override
  Future<DataState<List<MovieEntity>>> getSavedMovies(
    EndpointEnum endpoint,
  ) async {
    try {
      List<MovieEntity> savedMovies =
          await database.movieDao.findMovies(endpoint.name);
      return DataSuccess(data: savedMovies);
    } catch (e) {
      return DataFailed(error: Exception(e));
    }
  }

  @override
  Future<void> saveGenre(GenreEntity genre) async {
    await database.genreDao.insertGenre(genre);
  }

  @override
  Future<DataState<List<GenreEntity>>> getSavedGenres() async {
    try {
      List<GenreEntity> savedGenres = await database.genreDao.findGenres();
      return DataSuccess(data: savedGenres);
    } catch (e) {
      return DataFailed(
        error: Exception(e),
      );
    }
  }

  @override
  Future<void> updateFavorite(FavoriteEntity favorite) async {
    FavoriteEntity? existingFavorite =
        await database.favoriteDao.findFavoriteById(favorite.id!);
    if (existingFavorite == null) {
      await database.favoriteDao.insertFavorite(favorite);
    } else {
      await database.favoriteDao.deleteFavorite(favorite);
    }
  }

  @override
  Future<DataState<List<FavoriteEntity>>> getFavoriteMovies() async {
    try {
      List<FavoriteEntity> favoriteMovies =
          await database.favoriteDao.findFavoriteMovies();
      return DataSuccess(data: favoriteMovies);
    } catch (e) {
      return DataFailed(
        error: Exception(e),
      );
    }
  }
}
