import 'package:floor/floor.dart';

import '../../core/index.dart';

@Entity(tableName: 'MovieEntity')
@TypeConverters(
  [
    GenreIdList,
    NullableNum,
    StringList,
  ],
)
class MovieEntity {
  final bool? adult;
  final String? backdropPath;
  final List<int> genreIds;

  @primaryKey
  final int? id;

  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final int? voteCount;
  final List<String> category;

  MovieEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.category,
  });

  String get backdropUrl => '${ApiRoutes.image}$backdropPath';

  String get posterUrl => '${ApiRoutes.image}$posterPath';

  String get voteAverageString => voteAverage.toString();
}
