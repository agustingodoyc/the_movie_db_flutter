import 'package:flutter/material.dart';

import '../constants/movie_texts.dart';
import '../constants/ui_constants.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: UIConstants.textsLargePadding,
        bottom: UIConstants.textsShortPadding,
      ),
      child: Text(
        MovieTexts.title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: UIConstants.titleFontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
