import '../../../core/index.dart';
import '../../../data/repositories/index.dart';
import '../../entities/genre_entity.dart';
import '../i_use_case.dart';

class GenresUseCase implements IUseCase {
  final Repository repository;
  final DatabaseRepository databaseRepository;

  GenresUseCase({
    required this.repository,
    required this.databaseRepository,
  });

  @override
  Future<DataState<List<GenreEntity>>> call({params}) async {
    try {
      final remoteGenres = await repository.fetchGenres();
      if (remoteGenres is DataSuccess) {
        await Future.forEach(
          remoteGenres.data!,
          (GenreEntity genre) async {
            databaseRepository.saveGenre(genre);
          },
        );
        return DataSuccess(data: remoteGenres.data!);
      } else {
        final savedGenres = await databaseRepository.getSavedGenres();
        if (savedGenres.data!.isEmpty) {
          return const DataEmpty();
        } else {
          return DataSuccess(data: savedGenres.data!);
        }
      }
    } catch (e) {
      return DataFailed(
        error: Exception(ErrorEnum.error),
      );
    }
  }
}
