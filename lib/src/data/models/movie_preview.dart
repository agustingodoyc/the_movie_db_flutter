import '../../domain/entities/genre_entity.dart';
import '../../domain/entities/movie_entity.dart';

class MoviePreview {
  final MovieEntity movie;
  final List<GenreEntity> genres;

  MoviePreview(
    this.movie,
    this.genres,
  );
}
