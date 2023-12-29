import 'dart:convert';
import 'dart:io';

import 'package:the_movie_db_flutter/src/data/models/index.dart';
import 'package:the_movie_db_flutter/src/domain/entities/index.dart';

class MockEntity {
  static final String _jsonMovieString =
      File('assets/mock_data/movie.json').readAsStringSync();

  static final Map<String, dynamic> _jsonMovieData =
      jsonDecode(_jsonMovieString);

  static final movieModel = MovieModel.fromJson(_jsonMovieData, 'category');
  static final MovieEntity movie = movieModel;

  static final String _jsonGenreString =
      File('assets/mock_data/genre.json').readAsStringSync();

  static final Map<String, dynamic> _jsonGenreData =
      jsonDecode(_jsonGenreString);

  static final genreModel = GenreModel.fromJson(_jsonGenreData);

  static final GenreEntity genre = genreModel;

  static final MoviePreview moviePreview = MoviePreview(
    movie: movie,
    genres: [genre],
    isFavorite: false,
  );
}
