import 'package:flutter/material.dart';

class VoteAverage extends StatelessWidget {
  final num voteAverage;
  static const double circleBorderWidth = 2.0;
  static const double innerCirclePadding = 0.8;
  static const double circlePadding = 5.0;
  static const double textSize = 15.0;
  static const double maxVoteValue = 10.0;
  static const int digits = 1;
  static const double lowAverage = 1.0 / 3.0;
  static const double mediumAverage = lowAverage * 2.0;

  const VoteAverage({
    super.key,
    required this.voteAverage,
  });

  double get votePercent => voteAverage / maxVoteValue;

  Color get progressColor {
    if (votePercent <= lowAverage) {
      return Colors.redAccent;
    } else if (votePercent <= mediumAverage) {
      return Colors.yellowAccent;
    } else {
      return Colors.greenAccent;
    }
  }

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
                  color: progressColor,
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
