import '../../core/utils/resources/data_state.dart';
import '../../data/models/genre_model.dart';

abstract class IGenresRepository {
  Future<DataState<List<GenreModel>>> fetchGenres();
}
