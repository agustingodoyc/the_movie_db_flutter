
import 'package:floor/floor.dart';

import '../../../../domain/entities/genre_entity.dart';

@dao
abstract class GenreDao {
  @Query('SELECT * FROM genres')
  Future<List<GenreEntity>> findGenres();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGenre(GenreEntity genre);
}
