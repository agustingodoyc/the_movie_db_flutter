import '../../../core/index.dart';
import '../../../data/repositories/repository.dart';
import '../../entities/genre_entity.dart';
import '../i_use_case.dart';

class GenresUseCase implements IUseCase {
  final Repository _repository;

  GenresUseCase({Repository? repository})
      : _repository = repository ?? Repository();

  @override
  Future<DataState<List<GenreEntity>>> call({params}) async {
    final response = await _repository.fetchGenres();
    if (response is DataSuccess) {
      return DataSuccess(data: response.data!);
    } else {
      return DataFailed(
        error: response.error ?? Exception(ErrorEnum.error),
      );
    }
  }
}
