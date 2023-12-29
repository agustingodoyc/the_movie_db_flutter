import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/utils/resources/data_state.dart';
import 'package:the_movie_db_flutter/src/data/repositories/database_repository.dart';
import 'package:the_movie_db_flutter/src/domain/index.dart';

class MockDatabaseRepository extends Mock implements DatabaseRepository {}

void main() {
  late DatabaseRepository databaseRepository;
  late FavoritesUseCase favoritesUseCase;
  const List<FavoriteEntity> mockResult = [];

  setUp(() {
    databaseRepository = MockDatabaseRepository();
    favoritesUseCase = FavoritesUseCase(
      databaseRepository: databaseRepository,
    );
  });

  test(
    'Success Testing',
        () async {
      when(
            () => databaseRepository.getFavoriteMovies(),
      ).thenAnswer(
            (_) => Future.value(
          const DataSuccess(data: mockResult),
        ),
      );
      DataState<List<FavoriteEntity>> result = await favoritesUseCase.call();
      expect(
        result,
        isA<DataSuccess<List<FavoriteEntity>>>(),
      );
    },
  );

  test(
    'Failed testing',
        () async {
      when(
            () => databaseRepository.getFavoriteMovies(),
      ).thenAnswer(
            (_) => Future.value(
          DataFailed(
            error: Exception('Failed to load'),
          ),
        ),
      );
      DataState<List<FavoriteEntity>> result = await favoritesUseCase.call();
      expect(
        result,
        isA<DataFailed<List<FavoriteEntity>>>(),
      );
    },
  );
}
