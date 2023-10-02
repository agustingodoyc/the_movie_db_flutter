import 'dart:core';
import 'package:flutter/material.dart';

import '../data_models/movie.dart';
import '../utils/route_constants.dart';
import '../utils/ui_constants.dart';

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
  late ColorScheme currentColorScheme;

  Future<void> _updateImage(ImageProvider provider) async {
    final ColorScheme newColorScheme =
        await ColorScheme.fromImageProvider(provider: provider);
    setState(() {
      currentColorScheme = newColorScheme;
    });
  }

  @override
  void initState() {
    super.initState();
    final posterProvider = NetworkImage(widget.payload.posterUrl);
    currentColorScheme = const ColorScheme.light();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateImage(posterProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: currentColorScheme,
      ),
      child: Padding(
        padding: const EdgeInsets.all(cardPadding),
        child: SizedBox(
          height: cardHeight,
          child: Card(
            color: currentColorScheme.primary,
            elevation: cardElevation,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteConstants.movieRoute,
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
                      horizontal: UIConstants.textsShortPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: UIConstants.textsLargePadding,
                          ),
                          child: Text(
                            widget.payload.title,
                            style: TextStyle(
                              color: currentColorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          widget.payload.releaseDate,
                          style: TextStyle(
                            color: currentColorScheme.onPrimary
                                .withOpacity(lessOpacity),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: UIConstants.textsShortPadding,
                          ),
                          child: Text(
                            widget.payload.overview,
                            style: TextStyle(
                              color: currentColorScheme.onPrimary,
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
