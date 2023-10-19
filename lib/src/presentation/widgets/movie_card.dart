import 'dart:core';
import 'package:flutter/material.dart';

import '../../config/themes/app_theme.dart';
import '../../core/utils/constants/app_dimens.dart';
import '../../core/utils/constants/route_strings.dart';
import '../../core/utils/resources/network_image.dart';
import '../../data/models/movie.dart';

class MovieCard extends StatefulWidget {
  final Movie payload;

  const MovieCard({
    super.key,
    required this.payload,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  static const lessOpacity = 0.6;
  static const cardHeight = 120.0;
  static const cardElevation = 5.0;
  static const cardPadding = 3.0;
  static const textLines = 2;
  ColorScheme imageColorScheme = const ColorScheme.light();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        NetworkImageUtil(url: widget.payload.posterUrl)
            .updateColorScheme()
            .then(
              (value) => setState(
                () {
                  imageColorScheme = value;
                },
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme().themeByColorScheme(imageColorScheme),
      child: Padding(
        padding: const EdgeInsets.all(cardPadding),
        child: SizedBox(
          height: cardHeight,
          child: Card(
            color: imageColorScheme.primary,
            elevation: cardElevation,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteStrings.movieRoute,
                      arguments: widget.payload,
                    );
                  },
                  child: Image.network(
                    widget.payload.posterUrl,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.textsShortPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppDimens.textsLargePadding,
                          ),
                          child: Text(
                            widget.payload.title,
                            style: TextStyle(
                              color: imageColorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          widget.payload.releaseDate,
                          style: TextStyle(
                            color: imageColorScheme.onPrimary
                                .withOpacity(lessOpacity),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppDimens.textsShortPadding,
                          ),
                          child: Text(
                            widget.payload.overview,
                            style: TextStyle(
                              color: imageColorScheme.onPrimary,
                            ),
                            maxLines: textLines,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
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
