import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/index.dart';
import '../../../../../data/models/movie_preview.dart';
import '../../../general/image_navigator.dart';
import '../../../general/vote_average.dart';

class CardStack extends StatelessWidget {
  const CardStack({
    super.key,
    required this.payload,
  });

  final MoviePreview payload;
  static const votePadding = 155.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageNavigator(payload: payload),
        Padding(
          padding: const EdgeInsets.only(top: votePadding),
          child: VoteAverage(
            voteAverage: payload.movie.voteAverage ?? MovieDefaults.voteAverage,
          ),
        ),
      ],
    );
  }
}
