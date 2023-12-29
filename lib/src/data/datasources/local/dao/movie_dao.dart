import 'package:floor/floor.dart';

import '../../../../domain/entities/movie_entity.dart';

@dao
abstract class MovieDao {
  @Query("SELECT * FROM movies WHERE category LIKE '%' || :endpoint || '%'")
  Future<List<MovieEntity>> findMovies(String endpoint);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(MovieEntity movie);
}
