import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/repositories/movies_repository.dart';
import '../models/movie.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  static const movies = 'assets/mock_data/movies.json';
  List<Movie> movieList = [];

  @override
  Future<List<Movie>> fetchMovies() async {
    return movieList.isEmpty ? await parseMovies() : movieList;
  }

  Future<List<Movie>> parseMovies() async {
    final jsonPath = await rootBundle.loadString(movies);
    return List.from(
      jsonDecode(jsonPath).map((movie) => Movie.fromJson(movie)),
    );
  }
}
