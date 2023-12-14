import 'package:floor/floor.dart';

@entity
class GenreEntity {
  @primaryKey
  final int? id;

  final String? name;

  GenreEntity({
    required this.id,
    required this.name,
  });
}
