import 'package:floor/floor.dart';

@Entity(tableName: 'genres')
class GenreEntity {
  @primaryKey
  final int? id;

  final String? name;

  GenreEntity({
    required this.id,
    required this.name,
  });
}
