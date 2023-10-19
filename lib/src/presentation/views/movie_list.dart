import 'package:flutter/material.dart';

import '../../core/utils/constants/error_strings.dart';
import '../../data/models/movie.dart';
import '../../data/repositories/movies_repository_impl.dart';
import '../../domain/repositories/movies_repository.dart';
import '../widgets/movie_card.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final MoviesRepository movieRepository = MoviesRepositoryImpl();
  late final Future<List<Movie>> movies;

  @override
  void initState() {
    movies = movieRepository.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Movie>>(
          future: movies,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Movie>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text(ErrorStrings.errorMessage);
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    final payload = snapshot.data![index];
                    return MovieCard(payload: payload);
                  },
                );
              } else {
                return const Text(ErrorStrings.emptyMessage);
              }
            } else {
              return const Text(ErrorStrings.otherMessage);
            }
          },
        ),
      ),
    );
  }
}
