import '../../data_models/genre.dart';

abstract class IGenresRepository {
  Future<List<Genre>> fetchGenres();
}
