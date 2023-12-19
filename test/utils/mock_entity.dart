import 'package:the_movie_db_flutter/src/data/models/index.dart';
import 'package:the_movie_db_flutter/src/domain/entities/index.dart';

 class MockEntity {
   static final movieModel = MovieModel(
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
     category: ['category'],
   );
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
      category: ['category'],
    );

    static final genre = GenreEntity(
      id: 0,
      name: 'name',
    );

    static final MoviePreview moviePreview = MoviePreview(movie, [genre]);
  }
