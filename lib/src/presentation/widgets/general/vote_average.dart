import 'package:flutter/material.dart';

class VoteAverage extends StatelessWidget {
  final num voteAverage;
  static const double circleBorderWidth = 2.0;
  static const double innerCirclePadding = 0.8;
  static const double circlePadding = 5.0;
  static const double textSize = 15.0;
  static const double maxVoteValue = 10.0;
  static const int digits = 1;

  const VoteAverage({
    super.key,
    required this.voteAverage,
  });

  double get votePercent => voteAverage / maxVoteValue;

  @override
  Widget build(BuildContext context) {
    return Align(
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
                voteAverage.toStringAsFixed(digits),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: textSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
