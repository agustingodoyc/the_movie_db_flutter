import 'dart:convert';

import 'package:flutter/services.dart';

import '../../data_models/movie.dart';
import '../interface/i_movies_repository.dart';

class MoviesRepository implements IMoviesRepository {
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
