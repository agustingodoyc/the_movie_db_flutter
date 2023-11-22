import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/utils/resources/data_state.dart';
import 'package:the_movie_db_flutter/src/data/models/genre_model.dart';
import 'package:the_movie_db_flutter/src/data/repositories/repository.dart';
import 'package:the_movie_db_flutter/src/domain/entities/genre_entity.dart';
import 'package:the_movie_db_flutter/src/domain/use_cases/implementation/genres_use_case.dart';

class MockGenresRepository extends Mock implements Repository {}

void main() {
  late Repository repository;
  late GenresUseCase genresUseCase;
  const List<GenreModel> mockResult = [];

  setUp(() {
    repository = MockGenresRepository();
    genresUseCase = GenresUseCase(repository: repository);
  });

  test(
    'Success Testing',
        () async {
      when(
            () => repository.fetchGenres(),
      ).thenAnswer(
            (_) => Future.value(
          const DataSuccess(data: mockResult),
        ),
      );
      DataState<List<GenreEntity>> result =
      await genresUseCase.call();
      expect(
        result,
        isA<DataSuccess<List<GenreEntity>>>(),
      );
    },
  );

  test(
    'Failed testing',
        () async {
      when(
            () => repository.fetchGenres(),
      ).thenAnswer(
            (_) => Future.value(
          DataFailed(
            error: Exception('Failed to load'),
          ),
        ),
      );
      DataState<List<GenreEntity>> result =
      await genresUseCase.call();
      expect(
        result,
        isA<DataFailed<List<GenreEntity>>>(),
      );
    },
  );
}
