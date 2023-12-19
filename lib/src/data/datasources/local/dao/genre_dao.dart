
import 'package:floor/floor.dart';

import '../../../../domain/entities/genre_entity.dart';

@dao
abstract class GenreDao {
  @Query('SELECT * FROM GenreEntity')
  Future<List<GenreEntity>> findGenres();

  @Query('SELECT * FROM GenreEntity WHERE id = :id')
  Future<GenreEntity?> findGenreById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGenre(GenreEntity genre);
}
