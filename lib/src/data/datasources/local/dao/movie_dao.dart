import 'package:floor/floor.dart';

import '../../../../domain/entities/movie_entity.dart';

@dao
abstract class MovieDao {
  @Query(
    "SELECT * FROM MovieEntity WHERE category LIKE '%' || :endpoint || '%'",
  )
  Future<List<MovieEntity>> findMovies(String endpoint);

  @Query('SELECT * FROM MovieEntity WHERE id = :id')
  Future<MovieEntity?> findMovieById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(MovieEntity movie);
}
