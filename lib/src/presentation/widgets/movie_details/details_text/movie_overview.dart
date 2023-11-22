import 'package:flutter/material.dart';

import '../../../../core/utils/constants/index.dart';


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
            vertical: AppPaddings.textsShort,
            horizontal: AppPaddings.textsLarge,
          ),
          child: Text(
            AppTitles.overview,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: FontSizes.heading,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.textsShort,
            horizontal: AppPaddings.textsLarge,
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
