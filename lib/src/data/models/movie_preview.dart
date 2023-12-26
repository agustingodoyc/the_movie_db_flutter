import '../../domain/entities/index.dart';

class MoviePreview {
  final MovieEntity movie;
  final List<GenreEntity> genres;
  bool isFavorite;

  MoviePreview({
    required this.movie,
    required this.genres,
    required this.isFavorite,
  });
}
