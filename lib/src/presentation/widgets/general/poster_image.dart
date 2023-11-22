import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/constants/routes/app_resources.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (
        BuildContext context,
        String url,
      ) =>
          Image.asset(AppResources.placeholder),
      errorWidget: (
        BuildContext context,
        String url,
        Object error,
      ) =>
          Image.asset(AppResources.placeholder),
      fit: BoxFit.cover,
    );
  }
}
