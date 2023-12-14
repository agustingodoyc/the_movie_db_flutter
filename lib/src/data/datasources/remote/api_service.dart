import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../../core/utils/index.dart';

class ApiService {
  final Client client;

  ApiService({required this.client});

  Future<DataState<Map<String, dynamic>>> fetchMovies(
    EndpointEnum endpoint,
  ) async {
    String uri =
        '${ApiRoutes.movies}${endpoint.endpoint}${ApiRoutes.apiKeyUrl}';
    return _fetch(uri);
  }

  Future<DataState<Map<String, dynamic>>> fetchGenres() async {
    String uri = ApiRoutes.genres;
    return _fetch(uri);
  }

  Future<DataState<Map<String, dynamic>>> _fetch(String uri) async {
    try {
      final response = await client.get(
        Uri.parse(uri),
      );
      if (response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          data: jsonDecode(response.body),
        );
      } else {
        return DataFailed(
          error:
              Exception('Error occurred while fetching data: ${response.body}'),
        );
      }
    } catch (e) {
      return DataFailed(
        error: Exception('Exception occurred while fetching data: $e'),
      );
    }
  }
}
