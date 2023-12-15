import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
    required super.category,
  });

  factory MovieModel.fromJson(
    Map<String, dynamic> result,
    String category,
  ) {
    return MovieModel(
      adult: result['adult'],
      backdropPath: result['backdrop_path'],
      genreIds: List.from(result['genre_ids']),
      id: result['id'],
      originalLanguage: result['original_language'],
      originalTitle: result['original_title'],
      overview: result['overview'],
      popularity: result['popularity'],
      posterPath: result['poster_path'],
      releaseDate: result['release_date'],
      title: result['title'],
      video: result['video'],
      voteAverage: result['vote_average'],
      voteCount: result['vote_count'],
      category: <String>[category],
    );
  }
}
