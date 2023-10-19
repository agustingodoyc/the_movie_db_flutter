import '../../data/models/genre.dart';

abstract class GenresRepository {
  Future<List<Genre>> fetchGenres();
}
