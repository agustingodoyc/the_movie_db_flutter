import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/ui_constants.dart';

class MovieOverview extends StatelessWidget {
  final String overview;

  const MovieOverview({
    super.key,
    required this.overview,
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
            Constants.overviewTitle,
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
            overview,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ],
    );
  }
}
