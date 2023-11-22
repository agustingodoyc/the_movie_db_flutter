import 'package:the_movie_db_flutter/src/data/models/movie_preview.dart';
import 'package:the_movie_db_flutter/src/domain/entities/genre_entity.dart';
import 'package:the_movie_db_flutter/src/domain/entities/movie_entity.dart';

 class MockEntity {
    static final movie = MovieEntity(
      adult: false,
      backdropPath: 'backdropPath',
      genreIds: [0],
      id: 0,
      originalLanguage: 'originalLanguage',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 0.0,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      video: false,
      voteAverage: 0.0,
      voteCount: 0,
    );

    static final genre = GenreEntity(
      id: 0,
      name: 'name',
    );

    static final MoviePreview moviePreview = MoviePreview(movie, [genre]);
  }
