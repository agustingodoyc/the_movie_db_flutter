import 'package:flutter/material.dart';

import '../../../core/utils/constants/index.dart';
import '../../../data/models/movie_preview.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({
    super.key,
    required this.payload,
    ColorScheme? imageColorScheme,
    int? lines,
  })  : imageColorScheme = imageColorScheme ?? const ColorScheme.light(),
        lines = lines ?? 1;

  final MoviePreview payload;
  final ColorScheme imageColorScheme;
  static const lessOpacity = 0.6;
  final int lines;

  @override
  Widget build(BuildContext context) {
    final movie = payload.movie;
    Color textColor = imageColorScheme.onPrimary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              NavigationRoutes.movie,
              arguments: payload,
            );
          },
          child: Text(
            movie.title ?? MovieDefaults.title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
            maxLines: lines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          movie.releaseDate ?? MovieDefaults.releaseDate,
          style: TextStyle(
            color: textColor.withOpacity(lessOpacity),
          ),
        ),
      ],
    );
  }
}
