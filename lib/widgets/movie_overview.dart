import 'package:flutter/material.dart';

import '../constants/movie_texts.dart';
import '../constants/ui_constants.dart';

class MovieOverview extends StatelessWidget {
  const MovieOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: UIConstants.textsShortPadding,
            horizontal: UIConstants.textsLargePadding,
          ),
          child: Text(
            MovieTexts.overviewTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: UIConstants.titleFontSize,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: UIConstants.textsShortPadding,
            horizontal: UIConstants.textsLargePadding,
          ),
          child: Text(
            MovieTexts.overview,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}
