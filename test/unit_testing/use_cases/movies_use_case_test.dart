import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/utils/index.dart';
import 'package:the_movie_db_flutter/src/data/index.dart';
import 'package:the_movie_db_flutter/src/domain/index.dart';

import '../../utils/mock_entity.dart';

class MockMoviesRepository extends Mock implements Repository {}

class MockDatabaseRepository extends Mock implements DatabaseRepository {}

void main() {
  late Repository repository;
  late DatabaseRepository databaseRepository;
  late MoviesUseCase moviesUseCase;
  const EndpointEnum endpoint = EndpointEnum.popular;
  Result mockResult = Result(
    page: 1,
    results: [MockEntity.movieModel],
    totalPages: 1,
    totalResults: 1,
  );

  setUp(() {
    repository = MockMoviesRepository();
    databaseRepository = MockDatabaseRepository();
    moviesUseCase = MoviesUseCase(
      repository: repository,
      databaseRepository: databaseRepository,
    );
    registerFallbackValue(endpoint);
  });

  test(
    'Success Testing',
    () async {
      when(
        () => repository.fetchMovies(endpoint),
      ).thenAnswer(
        (_) => Future.value(
          DataSuccess(data: mockResult),
        ),
      );
      when(
        () => databaseRepository.saveMovie(
          mockResult.results.first,
          endpoint,
        ),
      ).thenAnswer(
        (_) => Future.value(),
      );
      when(
        () => databaseRepository.getSavedMovies(endpoint),
      ).thenAnswer(
        (_) => Future.value(
          DataSuccess(data: [MockEntity.movie]),
        ),
      );
      DataState<List<MovieEntity>> result =
          await moviesUseCase.call(params: endpoint);
      expect(
        result,
        isA<DataSuccess<List<MovieEntity>>>(),
      );
    },
  );

  test(
    'Failed testing',
    () async {
      when(
        () => repository.fetchMovies(
          any(),
        ),
      ).thenAnswer(
        (_) => Future.value(
          DataFailed(
            error: Exception('Failed to load'),
          ),
        ),
      );
      DataState<List<MovieEntity>> result =
          await moviesUseCase.call(params: EndpointEnum.upcoming);
      expect(
        result,
        isA<DataFailed<List<MovieEntity>>>(),
      );
    },
  );
}
