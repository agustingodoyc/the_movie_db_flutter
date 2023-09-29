import 'package:flutter/material.dart';

import '../constants/movie_texts.dart';
import '../constants/ui_constants.dart';

class VoteAverage extends StatelessWidget {
  const VoteAverage({super.key});

  static const circleBorderWidth = 2.0;
  static const innerCirclePadding = 0.8;
  static const cardTextPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: UIConstants.imagePadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Card(
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.indigo.shade900,
              width: circleBorderWidth,
            ),
          ),
          color: Colors.greenAccent.shade700,
          child: Padding(
            padding: const EdgeInsets.all(innerCirclePadding),
            child: Card(
              shape: const CircleBorder(),
              color: Colors.indigo.shade900,
              child: Padding(
                padding: const EdgeInsets.all(cardTextPadding),
                child: Text(
                  MovieTexts.voteAverage,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: UIConstants.titleFontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
