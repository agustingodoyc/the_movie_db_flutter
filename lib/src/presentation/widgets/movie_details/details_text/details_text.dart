import 'package:flutter/cupertino.dart';

import '../../../../core/utils/constants/index.dart';
import '../../../../data/models/movie_preview.dart';
import '../../../../domain/entities/genre_entity.dart';
import '../../../../domain/entities/movie_entity.dart';
import 'details_box.dart';
import 'movie_overview.dart';

class DetailsText extends StatelessWidget {
  const DetailsText({
    super.key,
    required this.payload,
  });

  final MoviePreview payload;
  static const String genresSeparator = ', ';

  String _getGenresAsString(List<GenreEntity> genres) =>
      genres.map((genre) => genre.name).join(genresSeparator);

  @override
  Widget build(BuildContext context) {
    MovieEntity movie = payload.movie;
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: AppPaddings.textsShort),
          child: DetailsBox(
            releaseDate: movie.releaseDate ?? MovieDefaults.releaseDate,
            genres: _getGenresAsString(payload.genres),
          ),
        ),
        MovieOverview(overview: movie.overview ?? AppTitles.overview),
      ],
    );
  }
}
