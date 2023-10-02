import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

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
        top: UIConstants.textsLargePadding,
        bottom: UIConstants.textsShortPadding,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: UIConstants.titleFontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
