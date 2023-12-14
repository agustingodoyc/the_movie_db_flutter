import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_flutter/src/data/datasources/index.dart';
import 'package:the_movie_db_flutter/src/domain/entities/index.dart';

import '../utils/mock_entity.dart';

void main() {
  late AppDatabase mockDatabase;
  late MovieDao mockMovieDao;
  late GenreDao mockGenreDao;
  MovieEntity mockMovie = MockEntity.movie;
  GenreEntity mockGenre = MockEntity.genre;

  setUp(
    () async {
      mockDatabase = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
      mockMovieDao = mockDatabase.movieDao;
      mockGenreDao = mockDatabase.genreDao;
    },
  );

  group(
    'Movie Database Test',
    () {
      test(
        'findMovies Test',
        () async {
          await mockMovieDao.insertMovie(mockMovie);
          final actual =
              await mockMovieDao.findMovies(mockMovie.category.first);
          expect(
            actual[0].id,
            equals(mockMovie.id),
          );
        },
      );

      test(
        'findMovieById Test',
        () async {
          await mockMovieDao.insertMovie(mockMovie);
          final actual = await mockMovieDao.findMovieById(mockMovie.id!);
          expect(
            actual?.id,
            equals(mockMovie.id),
          );
        },
      );
    },
  );

  group(
    'Genres Database Test',
    () {
      test(
        'findGenres Test',
        () async {
          await mockGenreDao.insertGenre(mockGenre);
          final actual = await mockGenreDao.findGenres();
          expect(
            actual[0].id,
            equals(mockGenre.id),
          );
        },
      );

      test(
        'findGenreById Test',
        () async {
          await mockGenreDao.insertGenre(mockGenre);
          final actual = await mockGenreDao.findGenreById(mockGenre.id!);
          expect(
            actual?.id,
            equals(mockGenre.id),
          );
        },
      );
    },
  );

  tearDown(
    () async {
      await mockDatabase.close();
    },
  );
}
