import 'dart:core';
import 'package:flutter/material.dart';

import '../../../../config/themes/app_theme.dart';
import '../../../../core/utils/constants/index.dart';
import '../../../../core/utils/resources/color_scheme_util.dart';
import '../../../../data/models/movie_preview.dart';
import '../../general/image_navigator.dart';
import 'card_text.dart';

class ColumnCard extends StatefulWidget {
  final MoviePreview payload;

  const ColumnCard({
    super.key,
    required this.payload,
  });

  @override
  State<ColumnCard> createState() => _ColumnCardState();
}

class _ColumnCardState extends State<ColumnCard> {
  late MoviePreview payload;
  static const cardHeight = 138.0;
  static const cardElevation = 5.0;
  ColorScheme imageColorScheme = const ColorScheme.light();

  @override
  void initState() {
    super.initState();
    payload = widget.payload;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ColorSchemeUtil(url: payload.movie.posterUrl).colorScheme.then(
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
      data: AppTheme(colorScheme: imageColorScheme).darkTheme,
      child: SizedBox(
        height: cardHeight,
        child: Card(
          color: imageColorScheme.primary,
          elevation: cardElevation,
          child: Row(
            children: [
              ImageNavigator(payload: payload),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppPaddings.textsShort),
                  child: CardText(
                    payload: payload,
                    imageColorScheme: imageColorScheme,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
