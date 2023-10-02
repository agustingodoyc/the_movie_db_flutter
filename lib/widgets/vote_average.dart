import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class VoteAverage extends StatelessWidget {
  final num voteAverage;
  static const circleBorderWidth = 2.0;
  static const innerCirclePadding = 0.8;
  static const circlePadding = 5.0;
  static const textSize = 15.0;
  static const maxVoteValue = 10.0;

  const VoteAverage({
    super.key,
    required this.voteAverage,
  });

  double get votePercent => voteAverage / maxVoteValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: UIConstants.imagePadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Card(
          shape: const CircleBorder(),
          color: Colors.indigo.shade900,
          child: Padding(
            padding: const EdgeInsets.all(innerCirclePadding),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(circlePadding),
                  child: CircularProgressIndicator(
                    value: votePercent,
                    backgroundColor: Colors.indigo,
                    color: Colors.greenAccent,
                    strokeWidth: circleBorderWidth,
                  ),
                ),
                Text(
                  voteAverage.toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: textSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
