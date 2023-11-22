import '../../../core/index.dart';
import '../../../data/repositories/repository.dart';
import '../../entities/movie_entity.dart';
import '../i_use_case.dart';

class MoviesUseCase implements IUseCase {
  final Repository _repository;

  MoviesUseCase({Repository? repository})
      : _repository = repository ?? Repository();

  @override
  Future<DataState<List<MovieEntity>>> call({params}) async {
    final response = await _repository.fetchMovies(params);
    if (response is DataSuccess) {
      return DataSuccess(data: response.data!.results);
    } else {
      return DataFailed(
        error: response.error ?? Exception(ErrorEnum.error),
      );
    }
  }
}
