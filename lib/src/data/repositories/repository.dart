import '../../core/utils/resources/data_state.dart';
import '../../domain/repositories/i_genres_repository.dart';
import '../../domain/repositories/i_movies_repository.dart';
import '../datasources/remote/api_service.dart';
import '../models/genre_model.dart';
import '../models/result.dart';

class Repository implements IGenresRepository, IMoviesRepository {
  final ApiService _apiService;

  Repository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  @override
  Future<DataState<List<GenreModel>>> fetchGenres() async {
    DataState<dynamic> result = await _apiService.fetchGenres();
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
  }

  @override
  Future<DataState<Result>> fetchMovies(chosenEndpoint) async {
    DataState<dynamic> result = await _apiService.fetchMovies(chosenEndpoint);
    if (result is DataSuccess) {
      return DataSuccess<Result>(
        data: Result.fromJson(result.data),
      );
    } else {
      return DataFailed<Result>(error: result.error!);
    }
  }
}
