import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/index.dart';
import 'package:the_movie_db_flutter/src/domain/index.dart';
import 'package:the_movie_db_flutter/src/presentation/blocs/movies_bloc.dart';

class MockMoviesUseCase extends Mock implements MoviesUseCase {}

class MockGenresUseCase extends Mock implements GenresUseCase {}

class MockFavoritesUseCase extends Mock implements FavoritesUseCase {}

void main() async {
  late MoviesBloc moviesBloc;
  late MoviesUseCase mockMoviesUseCase;
  late GenresUseCase mockGenresUseCase;
  late FavoritesUseCase mockFavoritesUseCase;

  final List<MovieEntity> moviesList = [];

  final List<GenreEntity> genresList = [];

  final List<FavoriteEntity> favList = [];

  setUp(
    () async {
      mockMoviesUseCase = MockMoviesUseCase();
      mockGenresUseCase = MockGenresUseCase();
      mockFavoritesUseCase = MockFavoritesUseCase();
      moviesBloc = MoviesBloc(
        genresUseCase: mockGenresUseCase,
        moviesUseCase: mockMoviesUseCase,
        favoritesUseCase: mockFavoritesUseCase,
      );
      when(
            () => mockFavoritesUseCase.call(),
      ).thenAnswer(
            (_) async => DataSuccess(data: favList),
      );
      await moviesBloc.initialize();
      registerFallbackValue(EndpointEnum.popular);
      when(
        () => mockMoviesUseCase.call(
          params: any(named: 'params'),
        ),
      ).thenAnswer(
        (_) async => DataSuccess(data: moviesList),
      );
      when(
        () => mockGenresUseCase.call(
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
      moviesBloc.fetchMoviesByEndpoint(EndpointEnum.popular);
    },
  );

  test(
    'Use Case Calls',
    () async {
      await moviesBloc.fetchMoviesByEndpoint(EndpointEnum.popular);
      verify(
        () => mockMoviesUseCase.call(
          params: any(named: 'params'),
        ),
      ).called(1);
      verify(
        () => mockGenresUseCase.call(
          params: any(named: 'params'),
        ),
      ).called(1);
      verifyNoMoreInteractions(mockMoviesUseCase);
      verifyNoMoreInteractions(mockGenresUseCase);
    },
  );

  test('Failed test', () async {
    when(
      () => mockMoviesUseCase.call(
        params: any(named: 'params'),
      ),
    ).thenAnswer(
      (_) async => DataFailed(
        error: Exception(ErrorEnum.error),
      ),
    );
    when(
      () => mockGenresUseCase.call(
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
    await moviesBloc.fetchMoviesByEndpoint(EndpointEnum.topRated);
  });

  tearDown(
    () => moviesBloc.dispose(),
  );
}
