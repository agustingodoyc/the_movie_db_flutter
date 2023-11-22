import 'package:flutter/material.dart';

import '../../../../core/utils/constants/index.dart';
import '../../../../data/models/movie_preview.dart';
import '../../general/card_title.dart';



class CardText extends StatelessWidget {
  const CardText({
    super.key,
    required this.payload,
    required this.imageColorScheme,
  });

  final MoviePreview payload;
  final ColorScheme imageColorScheme;
  static const textLines = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.textsShort,
          ),
          child: CardTitle(
            payload: payload,
            imageColorScheme: imageColorScheme,
          ),
        ),
        Text(
          payload.movie.overview ?? AppTitles.overview,
          style: TextStyle(color: imageColorScheme.onPrimary),
          maxLines: textLines,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
