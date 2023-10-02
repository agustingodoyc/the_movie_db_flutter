import 'dart:convert';

import 'package:flutter/services.dart';

import '../../data_models/genre.dart';
import '../interface/i_genres_repository.dart';

class GenresRepository implements IGenresRepository {
  static const genres = 'assets/mock_data/genres.json';
  List<Genre> genresList = [];

  @override
  Future<List<Genre>> fetchGenres() async {
    return genresList.isEmpty ? await parseGenres() : genresList;
  }

  Future<List<Genre>> parseGenres() async {
    final jsonPath = await rootBundle.loadString(genres);
    final Map<String, dynamic> json = jsonDecode(jsonPath);
    return genresList = json['genres']
        .map<Genre>((genreJson) => Genre.fromJson(genreJson))
        .toList();
  }
}
