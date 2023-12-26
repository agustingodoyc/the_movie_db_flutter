import '../../../core/utils/resources/data_state.dart';
import '../../../data/repositories/database_repository.dart';
import '../../entities/favorite_entity.dart';
import '../i_use_case.dart';

class FavoritesUseCase implements IUseCase {
  final DatabaseRepository databaseRepository;

  FavoritesUseCase({required this.databaseRepository});

  @override
  Future<DataState<List<FavoriteEntity>>> call({params}) async {
    if (params != null) {
      var favorite = FavoriteEntity(id: params);
      await databaseRepository.updateFavorite(favorite);
    }
    try {
      final favoriteMovies = await databaseRepository.getFavoriteMovies();
      return DataSuccess(data: favoriteMovies.data!);
    } catch (e) {
      return DataFailed(
        error: Exception(e),
      );
    }
  }
}
