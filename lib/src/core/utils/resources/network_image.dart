import 'package:flutter/material.dart';

class NetworkImageUtil {
  final String url;
  ColorScheme imageColorScheme = ColorScheme.light();

  NetworkImageUtil({required this.url});

  Future<ColorScheme> updateColorScheme() async {
    final ColorScheme newColorScheme =
        await ColorScheme.fromImageProvider(provider: NetworkImage(url));
    return newColorScheme;
  }

  ColorScheme get colorScheme {
    updateColorScheme();
    return imageColorScheme;
  }
}
