import 'package:flutter/material.dart';

import '../constants/movie_texts.dart';
import '../constants/ui_constants.dart';

class FocusBox extends StatelessWidget {
  const FocusBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: UIConstants.textsShortPadding),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).focusColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: UIConstants.textsShortPadding),
          child: Column(
            children: [
              Text(
                MovieTexts.date,
                style:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
              Text(
                MovieTexts.genres,
                style:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
