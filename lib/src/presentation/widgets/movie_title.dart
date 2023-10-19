import 'package:flutter/material.dart';

import '../../core/utils/constants/app_dimens.dart';


class MovieTitle extends StatelessWidget {
  final String title;

  const MovieTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimens.textsLargePadding,
        bottom: AppDimens.textsShortPadding,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: AppDimens.titleFontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
