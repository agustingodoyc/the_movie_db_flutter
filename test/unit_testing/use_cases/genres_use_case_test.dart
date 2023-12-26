import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/utils/resources/data_state.dart';
import 'package:the_movie_db_flutter/src/data/index.dart';
import 'package:the_movie_db_flutter/src/domain/entities/genre_entity.dart';
import 'package:the_movie_db_flutter/src/domain/use_cases/implementation/genres_use_case.dart';

class MockRepository extends Mock implements Repository {}

class MockDatabaseRepository extends Mock implements DatabaseRepository {}

void main() {
  late Repository repository;
  late DatabaseRepository databaseRepository;
  late GenresUseCase genresUseCase;
  const List<GenreModel> mockResult = [];

  setUp(() {
    repository = MockRepository();
    databaseRepository = MockDatabaseRepository();
    genresUseCase = GenresUseCase(
      repository: repository,
      databaseRepository: databaseRepository,
    );
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
      DataState<List<GenreEntity>> result = await genresUseCase.call();
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
      DataState<List<GenreEntity>> result = await genresUseCase.call();
      expect(
        result,
        isA<DataFailed<List<GenreEntity>>>(),
      );
    },
  );
}
