import 'package:floor/floor.dart';

@Entity(tableName: 'favorite_movies')
class FavoriteEntity {
  @primaryKey
  final int? id;

  FavoriteEntity({required this.id});

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return (other is FavoriteEntity && other.id == id);
  }
}
