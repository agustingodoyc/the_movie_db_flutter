import 'package:flutter/material.dart';

import '../../core/utils/constants/app_dimens.dart';
import '../../core/utils/constants/app_strings.dart';


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
            vertical: AppDimens.textsShortPadding,
            horizontal: AppDimens.textsLargePadding,
          ),
          child: Text(
            AppStrings.overviewTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: AppDimens.titleFontSize,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimens.textsShortPadding,
            horizontal: AppDimens.textsLargePadding,
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
