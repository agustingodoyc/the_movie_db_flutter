import '../../core/utils/enums/endpoint_enum.dart';
import '../../core/utils/resources/data_state.dart';
import '../entities/index.dart';

abstract class IDatabaseRepository {
  Future<void> saveMovie(MovieEntity movie,
      EndpointEnum endpoint,);

  Future<DataState<List<MovieEntity>>> getSavedMovies(EndpointEnum endpoint);

  Future<void> saveGenre(GenreEntity genre);

  Future<DataState<List<GenreEntity>>> getSavedGenres();

  Future<void> updateFavorite(FavoriteEntity favoriteEntity);

  Future<DataState<List<FavoriteEntity>>> getFavoriteMovies();
}
