import 'package:flutter/material.dart';

import '../../config/themes/app_theme.dart';
import '../../core/utils/constants/index.dart';
import '../../core/utils/resources/color_scheme_util.dart';
import '../../data/models/movie_preview.dart';
import '../../domain/entities/movie_entity.dart';
import '../widgets/general/app_drawer/app_drawer.dart';
import '../widgets/movie_details/details_text/details_text.dart';
import '../widgets/movie_details/details_vote_average.dart';
import '../widgets/movie_details/like_button.dart';
import '../widgets/movie_details/movie_header.dart';
import '../widgets/movie_details/movie_title.dart';

class MovieDetails extends StatefulWidget {
  final MoviePreview moviePreview;

  const MovieDetails({super.key, required this.moviePreview});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  ColorScheme _imageColorScheme = const ColorScheme.light();

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
  }

  @override
  Widget build(BuildContext context) {
    final MovieEntity movie = widget.moviePreview.movie;
    return Theme(
      data: AppTheme(colorScheme: _imageColorScheme).darkTheme,
      child: Scaffold(
        appBar: AppBar(),
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
              DetailsText(payload: widget.moviePreview),
              const LikeButton(),
            ],
          ),
        ),
        drawer: const AppDrawer(),
      ),
    );
  }
}
