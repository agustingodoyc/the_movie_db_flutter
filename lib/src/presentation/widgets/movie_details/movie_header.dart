import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants/index.dart';
import '../general/poster_image.dart';


class MovieHeader extends StatelessWidget {
  final String backdropUrl;
  final String posterUrl;
  static const backdropHeight = 200.0;

  const MovieHeader({
    super.key,
    required this.backdropUrl,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    String placeholderRoute = AppResources.placeholder;
    return SizedBox(
      height: backdropHeight,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppPaddings.backdropLeft),
            child: CachedNetworkImage(
              imageUrl: backdropUrl,
              placeholder: (
                context,
                url,
              ) =>
                  Image.asset(placeholderRoute),
              errorWidget: (
                context,
                url,
                error,
              ) =>
                  Image.asset(placeholderRoute),
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppPaddings.backdropLeft),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPaddings.image),
            child: PosterImage(imageUrl: posterUrl),
          ),
        ],
      ),
    );
  }
}
