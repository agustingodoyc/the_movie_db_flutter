import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/index.dart';
import 'package:the_movie_db_flutter/src/domain/entities/genre_entity.dart';
import 'package:the_movie_db_flutter/src/domain/entities/movie_entity.dart';
import 'package:the_movie_db_flutter/src/domain/use_cases/implementation/genres_use_case.dart';
import 'package:the_movie_db_flutter/src/domain/use_cases/implementation/movies_use_case.dart';
import 'package:the_movie_db_flutter/src/presentation/blocs/movies_bloc.dart';

class MockUseCaseMovies extends Mock implements MoviesUseCase {}

class MockUseCaseGenres extends Mock implements GenresUseCase {}

void main() async {
  late MoviesBloc moviesBloc;
  late MoviesUseCase mockUseCaseMovies;
  late GenresUseCase mockUseCaseGenres;

  final List<MovieEntity> movie = [];

  final List<GenreEntity> genresList = [];

  setUp(
    () async {
      mockUseCaseMovies = MockUseCaseMovies();
      mockUseCaseGenres = MockUseCaseGenres();
      moviesBloc = MoviesBloc(
        genresUseCase: mockUseCaseGenres,
        moviesUseCase: mockUseCaseMovies,
      );
      await moviesBloc.initialize();
      registerFallbackValue(EndpointEnum.popular);
      when(
        () => mockUseCaseMovies.call(
          params: any(named: 'params'),
        ),
      ).thenAnswer(
        (_) async => DataSuccess(data: movie),
      );
      when(
        () => mockUseCaseGenres.call(
          params: any(named: 'params'),
        ),
      ).thenAnswer(
        (_) async => DataSuccess(data: genresList),
      );
    },
  );

  test(
    'Success test',
    () async {
      Stream<StateEnum> resultPopular = moviesBloc
          .moviesStream(EndpointEnum.popular)
          .map((event) => event.state);

      final expected = [
        StateEnum.loading,
        StateEnum.success,
      ];
      expect(
        resultPopular,
        emitsInOrder(expected),
      );
      moviesBloc.fetchEndpointsMovies(EndpointEnum.popular);
    },
  );

  test(
    'Use Case Calls',
    () async {
      await moviesBloc.fetchEndpointsMovies(EndpointEnum.popular);
      verify(
        () => mockUseCaseMovies.call(
          params: any(named: 'params'),
        ),
      ).called(1);
      verify(
        () => mockUseCaseGenres.call(
          params: any(named: 'params'),
        ),
      ).called(1);
      verifyNoMoreInteractions(mockUseCaseMovies);
      verifyNoMoreInteractions(mockUseCaseGenres);
    },
  );

  test('Failed test', () async {
    when(
      () => mockUseCaseMovies.call(
        params: any(named: 'params'),
      ),
    ).thenAnswer(
      (_) async => DataFailed(
        error: Exception(ErrorEnum.error),
      ),
    );
    when(
      () => mockUseCaseGenres.call(
        params: any(named: 'params'),
      ),
    ).thenAnswer(
      (_) async => DataFailed(
        error: Exception(ErrorEnum.error),
      ),
    );
    Stream<StateEnum> resultTopRated = moviesBloc
        .moviesStream(EndpointEnum.topRated)
        .map((event) => event.state);

    final expected = [
      StateEnum.loading,
      StateEnum.failure,
    ];
    expectLater(
      resultTopRated,
      emitsInOrder(expected),
    );
    await moviesBloc.fetchEndpointsMovies(EndpointEnum.topRated);
  });

  tearDown(
    () => moviesBloc.dispose(),
  );
}
