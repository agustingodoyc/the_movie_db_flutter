import 'dart:core';

import 'package:flutter/material.dart';

import '../../../../../config/themes/app_theme.dart';
import '../../../../../core/utils/constants/index.dart';
import '../../../../../core/utils/resources/color_scheme_util.dart';
import '../../../../../data/models/movie_preview.dart';
import '../../../general/card_title.dart';
import 'card_stack.dart';

class RowCard extends StatefulWidget {
  final MoviePreview payload;

  const RowCard({
    super.key,
    required this.payload,
  });

  @override
  State<RowCard> createState() => _RowCardState();
}

class _RowCardState extends State<RowCard> {
  static const cardWidth = 130.0;
  static const cardElevation = 5.0;
  static const cardPadding = 3.0;
  static const titleLines = 2;
  ColorScheme imageColorScheme = ColorScheme.fromSwatch();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ColorSchemeUtil(url: widget.payload.movie.posterUrl).colorScheme.then(
          (value) {
            if (mounted) {
              setState(
                () {
                  imageColorScheme = value;
                },
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme(colorScheme: imageColorScheme).darkTheme,
      child: Padding(
        padding: const EdgeInsets.all(cardPadding),
        child: SizedBox(
          width: cardWidth,
          child: Card(
            color: imageColorScheme.primary,
            elevation: cardElevation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardStack(
                  payload: widget.payload,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPaddings.textsShort,
                  ),
                  child: CardTitle(
                    payload: widget.payload,
                    imageColorScheme: imageColorScheme,
                    lines: titleLines,
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
