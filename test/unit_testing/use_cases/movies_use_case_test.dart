import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/utils/enums/endpoint_enum.dart';
import 'package:the_movie_db_flutter/src/core/utils/resources/data_state.dart';
import 'package:the_movie_db_flutter/src/data/models/result.dart';
import 'package:the_movie_db_flutter/src/data/repositories/repository.dart';
import 'package:the_movie_db_flutter/src/domain/entities/movie_entity.dart';
import 'package:the_movie_db_flutter/src/domain/use_cases/implementation/movies_use_case.dart';

class MockMoviesRepository extends Mock implements Repository {}

void main() {
  late Repository repository;
  late MoviesUseCase moviesUseCase;
  const Result mockResult = Result(
    page: 1,
    results: [],
    totalPages: 1,
    totalResults: 1,
  );

  setUp(() {
    repository = MockMoviesRepository();
    moviesUseCase = MoviesUseCase(repository: repository);
    registerFallbackValue(EndpointEnum.upcoming);
  });

  test(
    'Success Testing',
    () async {
      when(
        () => repository.fetchMovies(EndpointEnum.upcoming),
      ).thenAnswer(
        (_) => Future.value(
          const DataSuccess(data: mockResult),
        ),
      );
      DataState<List<MovieEntity>> result =
          await moviesUseCase.call(params: EndpointEnum.upcoming);
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
