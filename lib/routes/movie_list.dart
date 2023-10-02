import 'package:flutter/material.dart';

import '../data_models/movie.dart';
import '../repositories/implementation/movies_repository.dart';
import '../repositories/interface/i_movies_repository.dart';
import '../utils/error_strings.dart';
import '../widgets/movie_card.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final IMoviesRepository movieRepository = MoviesRepository();
  late final Future<List<Movie>> movies;

  @override
  void initState() {
    movies = getMoviesList();
    super.initState();
  }

  Future<List<Movie>> getMoviesList() async {
    List<Movie> movies = await movieRepository.fetchMovies();

    return movies.map((movie) {
      return movie;
    }).toList();
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
