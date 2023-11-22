import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_flutter/src/core/utils/enums/endpoint_enum.dart';
import 'package:the_movie_db_flutter/src/core/utils/resources/data_state.dart';
import 'package:the_movie_db_flutter/src/data/datasources/remote/api_service.dart';

class MockClient extends Mock implements Client {}

void main() {
  late Client client;
  late ApiService apiService;

  setUp(
    () {
      client = MockClient();
      apiService = ApiService(client: client);
      registerFallbackValue(
        Uri(),
      );
    },
  );

  group(
    'fetchMovies test',
    () {
      test(
        'Success test',
        () async {
          when(
            () => client.get(
              any(),
            ),
          ).thenAnswer(
            (_) async => Future.value(
              Response(
                '{"status": "ok"}',
                HttpStatus.ok,
              ),
            ),
          );
          final result = await apiService.fetchMovies(EndpointEnum.upcoming);
          expect(
            result,
            isA<DataSuccess<dynamic>>(),
          );
        },
      );

      test(
        'Failed test',
        () async {
          when(
            () => client.get(
              any(),
            ),
          ).thenAnswer(
            (_) async => Future.value(
              Response(
                'Fetch failed',
                HttpStatus.badGateway,
              ),
            ),
          );
          final result = await apiService.fetchMovies(EndpointEnum.upcoming);
          expect(
            result,
            isA<DataFailed<dynamic>>(),
          );
        },
      );
    },
  );

  group(
    'fetchGenres test',
    () {
      test(
        'Success test',
        () async {
          when(
            () => client.get(
              any(),
            ),
          ).thenAnswer(
            (_) async => Future.value(
              Response(
                '{"status": "ok"}',
                HttpStatus.ok,
              ),
            ),
          );
          final result = await apiService.fetchGenres();
          expect(
            result,
            isA<DataSuccess<dynamic>>(),
          );
        },
      );

      test(
        'Failed test',
        () async {
          when(
            () => client.get(
              any(),
            ),
          ).thenAnswer(
            (_) async => Future.value(
              Response(
                'Fetch failed',
                HttpStatus.badGateway,
              ),
            ),
          );
          final result = await apiService.fetchGenres();
          expect(
            result,
            isA<DataFailed<dynamic>>(),
          );
        },
      );
    },
  );
}
