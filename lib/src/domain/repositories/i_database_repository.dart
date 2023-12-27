import '../../core/utils/index.dart';
import '../entities/index.dart';

abstract class IDatabaseRepository {
  Future<void> saveMovie(
    MovieEntity movie,
    EndpointEnum endpoint,
  );

  Future<DataState<List<MovieEntity>>> getSavedMovies(EndpointEnum endpoint);

  Future<void> saveGenre(GenreEntity genre);

  Future<DataState<List<GenreEntity>>> getSavedGenres();

  Future<void> updateFavorite(FavoriteEntity favoriteEntity);

  Future<DataState<List<FavoriteEntity>>> getFavoriteMovies();
}
