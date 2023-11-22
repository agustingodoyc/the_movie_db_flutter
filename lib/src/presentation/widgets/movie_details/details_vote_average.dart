import 'package:flutter/material.dart';

import '../../../core/utils/constants/index.dart';
import '../general/vote_average.dart';

class DetailsVoteAverage extends StatelessWidget {
  const DetailsVoteAverage({
    super.key,
    required this.voteAverage,
  });

  final num voteAverage;
  static const int _maxLines = 2;
  static const double _textWidth = 55.0;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        VoteAverage(voteAverage: voteAverage),
        SizedBox(
          width: _textWidth,
          child: Text(
            AppTitles.voteAverage,
            style: TextStyle(
              color: colorScheme.onPrimary,
            ),
            maxLines: _maxLines,
          ),
        ),
      ],
    );
  }
}
