import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/index.dart';
import 'package:the_movie_db_flutter/src/data/index.dart';
import 'package:the_movie_db_flutter/src/domain/entities/index.dart';

import '../../utils/mock_entity.dart';

class MockDatabase extends AppDatabase {
  @override
  MovieDao movieDao;

  @override
  GenreDao genreDao;

  MockDatabase(
    this.movieDao,
    this.genreDao,
  );
}

class MockMovieDao extends Mock implements MovieDao {}

class MockGenreDao extends Mock implements GenreDao {}

void main() {
  late AppDatabase mockDatabase;
  late DatabaseRepository databaseRepository;
  late MovieDao mockMovieDao;
  late GenreDao mockGenresDao;

  final MovieEntity mockMovie = MockEntity.movie;

  final GenreEntity mockGenre = MockEntity.genre;

  setUp(() {
    mockMovieDao = MockMovieDao();
    mockGenresDao = MockGenreDao();
    mockDatabase = MockDatabase(
      mockMovieDao,
      mockGenresDao,
    );
    databaseRepository = DatabaseRepository(mockDatabase);
    registerFallbackValue(mockMovie.category.first);
  });

  group(
    'Database Repository Test',
    () {
      group(
        'Movie Test',
        () {
          test(
            'saveMovie test',
            () async {
              when(
                () => mockMovieDao.findMovies(
                  any(),
                ),
              ).thenAnswer(
                (_) => Future.value(
                  [mockMovie],
                ),
              );
              DataState<List<MovieEntity>> localMovies =
                  await databaseRepository.getSavedMovies(EndpointEnum.popular);
              expect(
                localMovies,
                isA<DataSuccess<List<MovieEntity>>>(),
              );
            },
          );

          test(
            'getSavedMovies test',
            () async {
              when(
                () => mockMovieDao.findMovies(
                  any(),
                ),
              ).thenAnswer(
                (_) => Future.value(
                  any(),
                ),
              );
              DataState<List<MovieEntity>> localMovies =
                  await databaseRepository
                      .getSavedMovies(EndpointEnum.topRated);
              expect(
                localMovies,
                isA<DataState<List<MovieEntity>>>(),
              );
            },
          );

          test(
            'getMovieById test',
            () async {
              when(
                () => mockMovieDao.findMovieById(
                  any(),
                ),
              ).thenAnswer(
                (_) => Future.value(mockMovie),
              );
              MovieEntity? localMovies =
                  await databaseRepository.getMovieById(mockMovie);
              expect(
                localMovies,
                isA<MovieEntity>(),
              );
            },
          );
        },
      );

      group(
        'Genre test',
        () {
          test(
            'getSavedGenres test',
            () async {
              when(
                () => mockGenresDao.findGenres(),
              ).thenAnswer(
                (_) => Future.value(
                  [mockGenre],
                ),
              );
              DataState<List<GenreEntity>> localGenres =
                  await databaseRepository.getSavedGenres();
              expect(
                localGenres,
                isA<DataSuccess<List<GenreEntity>>>(),
              );
            },
          );
        },
      );
    },
  );
}
