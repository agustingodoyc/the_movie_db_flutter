import 'package:flutter/material.dart';

import '../../core/utils/constants/error_strings.dart';
import '../../core/utils/resources/network_image.dart';
import '../../data/models/genre.dart';
import '../../data/models/movie.dart';
import '../../data/repositories/genres_repository_impl.dart';
import '../../domain/repositories/genres_repository.dart';
import '../../config/themes/app_theme.dart';
import '../widgets/details_box.dart';
import '../widgets/like_button.dart';
import '../widgets/movie_header.dart';
import '../widgets/movie_overview.dart';
import '../widgets/movie_title.dart';
import '../widgets/vote_average.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  ColorScheme imageColorScheme = ColorScheme.light();
  static const String genresSeparator = ', ';
  final GenresRepository genresRepository = GenresRepositoryImpl();

  String getGenresAsString(List<Genre> genres) =>
      genres.map((genre) => genre.name).join(genresSeparator);

  Future<List<Genre>> mapMovieGenres(Movie movie) async {
    List<Genre> genres = await genresRepository.fetchGenres();
    return movie.genres
        .map((genreId) => genres.firstWhere((genre) => genre.id == genreId))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

        NetworkImageUtil(url: movie.posterUrl).updateColorScheme().then(
              (value) => setState(
                () {
                  imageColorScheme = value;
                },
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Theme(
      data: AppTheme().themeByColorScheme(imageColorScheme),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              MovieHeader(
                backdropUrl: movie.backdropUrl,
                posterUrl: movie.posterUrl,
              ),
              MovieTitle(title: movie.title),
              VoteAverage(voteAverage: movie.voteAverage),
              FutureBuilder<List<Genre>>(
                future: mapMovieGenres(movie),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<Genre>> snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text(ErrorStrings.errorMessage);
                    } else if (snapshot.hasData) {
                      return DetailsBox(
                        releaseDate: movie.releaseDate,
                        genres: getGenresAsString(snapshot.data!),
                      );
                    } else {
                      return const Text(ErrorStrings.emptyMessage);
                    }
                  } else {
                    return const Text(ErrorStrings.otherMessage);
                  }
                },
              ),
              MovieOverview(overview: movie.overview),
              const LikeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
