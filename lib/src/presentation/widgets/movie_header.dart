import 'package:flutter/material.dart';

import '../../core/utils/constants/app_dimens.dart';


class MovieHeader extends StatelessWidget {
  final String backdropUrl;
  final String posterUrl;
  static const backdropHeight = 250.0;

  const MovieHeader({
    super.key,
    required this.backdropUrl,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: backdropHeight,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppDimens.backdropLeftPadding),
            child: Image.network(
              backdropUrl,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppDimens.backdropLeftPadding),
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
            padding: const EdgeInsets.all(AppDimens.imagePadding),
            child: Image.network(
              posterUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
