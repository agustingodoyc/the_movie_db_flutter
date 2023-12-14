import '../../core/utils/resources/data_state.dart';
import '../../domain/repositories/i_genres_repository.dart';
import '../../domain/repositories/i_movies_repository.dart';
import '../datasources/remote/api_service.dart';
import '../models/genre_model.dart';
import '../models/result.dart';

class Repository implements IGenresRepository, IMoviesRepository {
  final ApiService apiService;

  Repository({required this.apiService});

  @override
  Future<DataState<List<GenreModel>>> fetchGenres() async {
    try {
      DataState<dynamic> result = await apiService.fetchGenres();
      if (result is DataSuccess) {
        return DataSuccess(
          data: List<GenreModel>.from(
            result.data['genres'].map(
              (genre) => GenreModel.fromJson(genre),
            ),
          ),
        );
      } else {
        return DataFailed(error: result.error!);
      }
    } catch (e) {
      return DataFailed(
        error: Exception(e),
      );
    }
  }

  @override
  Future<DataState<Result>> fetchMovies(chosenEndpoint) async {
    try {
      DataState<dynamic> result = await apiService.fetchMovies(chosenEndpoint);
      if (result is DataSuccess) {
        return DataSuccess<Result>(
          data: Result.fromJson(
            result.data,
            chosenEndpoint.name,
          ),
        );
      } else {
        return DataFailed<Result>(error: result.error!);
      }
    } catch (e) {
      return DataFailed(
        error: Exception(e),
      );
    }
  }
}
