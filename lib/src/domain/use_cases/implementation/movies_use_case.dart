import '../../../core/index.dart';
import '../../../data/repositories/index.dart';
import '../../entities/movie_entity.dart';
import '../i_use_case.dart';

class MoviesUseCase implements IUseCase {
  final Repository repository;
  final DatabaseRepository databaseRepository;

  MoviesUseCase({
    required this.repository,
    required this.databaseRepository,
  });

  @override
  Future<DataState<List<MovieEntity>>> call({params}) async {
    try {
      final remoteMovies = await repository.fetchMovies(params);
      final DataState<List<MovieEntity>> savedMovies;
      if (remoteMovies is DataSuccess) {
        await Future.forEach(
          remoteMovies.data!.results,
          (MovieEntity movie) async {
            await databaseRepository.saveMovie(
              movie,
              params,
            );
          },
        );
        savedMovies = await databaseRepository.getSavedMovies(params);
        return DataSuccess(data: savedMovies.data!);
      } else {
        savedMovies = await databaseRepository.getSavedMovies(params);
        if (savedMovies.data!.isEmpty) {
          return const DataEmpty();
        } else {
          return DataSuccess(data: savedMovies.data!);
        }
      }
    } catch (e) {
      return DataFailed(
        error: Exception(ErrorEnum.error),
      );
    }
  }
}
