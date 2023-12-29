import 'package:floor/floor.dart';

import '../../../../domain/entities/index.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM favorite_movies')
  Future<List<FavoriteEntity>> findFavoriteMovies();

  @Query('SELECT * FROM favorite_movies WHERE id = :id')
  Future<FavoriteEntity?> findFavoriteById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertFavorite(FavoriteEntity favorite);

  @delete
  Future<void> deleteFavorite(FavoriteEntity favorite);
}
