import 'dart:core';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/utils/enums/endpoint_enum.dart';
import 'package:the_movie_db_flutter/src/core/utils/resources/data_state.dart';
import 'package:the_movie_db_flutter/src/data/datasources/remote/api_service.dart';
import 'package:the_movie_db_flutter/src/data/models/genre_model.dart';
import 'package:the_movie_db_flutter/src/data/models/movie_model.dart';
import 'package:the_movie_db_flutter/src/data/models/result.dart';
import 'package:the_movie_db_flutter/src/data/repositories/repository.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late Repository repository;
  const List<MovieModel> movies = [];
  final Map<String, dynamic> mockMovies = {
    'page': 1,
    'results': movies,
    'total_pages': 1,
    'total_results': 1,
  };
  const List<GenreModel> genres = [];
  final Map<String, dynamic> mockGenres = {
    'genres': genres,
  };

  setUp(() {
    apiService = MockApiService();
    repository = Repository(apiService: apiService);
    registerFallbackValue(EndpointEnum.upcoming);
  });

  group('fetchMovies test', () {
    test(
      'Success test',
      () async {
        when(
          () => apiService.fetchMovies(
            any(),
          ),
        ).thenAnswer(
          (_) => Future.value(
            DataSuccess(data: mockMovies),
          ),
        );
        DataState<Result> result =
            await repository.fetchMovies(EndpointEnum.upcoming);
        expect(
          result,
          isA<DataSuccess<Result>>(),
        );
      },
    );

    test(
      'Failed test',
      () async {
        when(() => apiService.fetchMovies(any())).thenAnswer(
          (_) => Future.value(DataFailed(error: Exception('Failed to load'))),
        );
        DataState<Result> result =
            await repository.fetchMovies(EndpointEnum.upcoming);
        expect(result, isA<DataFailed<Result>>());
      },
    );
  });

  group('fetchGenres test', () {
    test(
      'Success test',
      () async {
        when(
          () => apiService.fetchGenres(),
        ).thenAnswer(
          (_) => Future.value(
            DataSuccess(data: mockGenres),
          ),
        );
        DataState<List<GenreModel>> result =
            await repository.fetchGenres();
        expect(
          result,
          isA<DataSuccess<List<GenreModel>>>(),
        );
      },
    );

    test(
      'Failed test',
      () async {
        when(
          () => apiService.fetchGenres(),
        ).thenAnswer(
          (_) => Future.value(
            DataFailed(
              error: Exception('Failed to load'),
            ),
          ),
        );
        DataState<List<GenreModel>> result =
            await repository.fetchGenres();
        expect(
          result,
          isA<DataFailed<List<GenreModel>>>(),
        );
      },
    );
  });
}
