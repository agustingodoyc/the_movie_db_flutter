import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/index.dart';
import '../../core/utils/index.dart';
import '../../data/models/movie_preview.dart';
import '../../domain/entities/movie_entity.dart';
import '../blocs/movies_bloc.dart';
import '../widgets/index.dart';

class MovieDetails extends StatefulWidget {
  final MoviePreview moviePreview;

  const MovieDetails({
    super.key,
    required this.moviePreview,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late MoviesBloc _moviesBloc;
  ColorScheme _imageColorScheme = const ColorScheme.light();
  final notificationManager = NotificationManager();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ColorSchemeUtil(url: widget.moviePreview.movie.posterUrl)
            .colorScheme
            .then(
              (value) => setState(
                () {
                  _imageColorScheme = value;
                },
              ),
            );
      },
    );
    _moviesBloc = Provider.of<DependencyHandler>(
      context,
      listen: false,
    ).moviesBloc;
  }

  @override
  Widget build(BuildContext context) {
    final MoviePreview payload = widget.moviePreview;
    final MovieEntity movie = payload.movie;
    return Theme(
      data: AppTheme(colorScheme: _imageColorScheme).darkTheme,
      child: Scaffold(
        appBar: const IconBar(),
        body: SafeArea(
          child: ListView(
            children: [
              MovieHeader(
                backdropUrl: movie.backdropUrl,
                posterUrl: movie.posterUrl,
              ),
              Center(
                child: MovieTitle(
                  title: movie.title ?? MovieDefaults.title,
                  releaseDate: movie.releaseDate ?? MovieDefaults.releaseDate,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: AppPaddings.image),
                child: DetailsVoteAverage(
                  voteAverage: movie.voteAverage ?? MovieDefaults.voteAverage,
                ),
              ),
              DetailsText(payload: payload),
              LikeButton(
                isFavorite: payload.isFavorite,
                onTap: () {
                  setState(() {
                    _moviesBloc.updateFavorite(movie.id!);
                    payload.isFavorite = !payload.isFavorite;
                  });
                  payload.isFavorite
                      ? notificationManager.addedFavorite()
                      : notificationManager.removedFavorite();
                },
              ),
            ],
          ),
        ),
        drawer: const AppDrawer(),
      ),
    );
  }
}
