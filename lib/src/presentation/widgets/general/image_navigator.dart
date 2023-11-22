import 'package:flutter/cupertino.dart';

import '../../../core/utils/constants/index.dart';
import '../../../data/models/movie_preview.dart';
import 'poster_image.dart';

class ImageNavigator extends StatelessWidget {
  const ImageNavigator({
    super.key,
    required this.payload,
  });

  final MoviePreview payload;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          NavigationRoutes.movie,
          arguments: payload,
        );
      },
      child: PosterImage(imageUrl: payload.movie.posterUrl),
    );
  }
}
