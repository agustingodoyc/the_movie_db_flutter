// Package imports
import 'package:flutter/material.dart';

// Local imports
import '../constants/routes/app_resources.dart';

class ColorSchemeUtil {
  final String _url;

  ColorSchemeUtil({String? url}) : _url = url ?? '';

  // Method to get the color scheme from a network image or a default image
  Future<ColorScheme> get colorScheme async {
    if (_url.isEmpty) {
      return _getDefaultColorScheme();
    } else {
      try {
        return await _getColorSchemeFromNetworkImage();
      } catch (e) {
        return _getDefaultColorScheme();
      }
    }
  }

  // Method to get the color scheme from a network image
  Future<ColorScheme> _getColorSchemeFromNetworkImage() async {
    final ImageProvider imageProvider = NetworkImage(_url);
    return ColorScheme.fromImageProvider(provider: imageProvider);
  }

  // Method to get the default color scheme
  Future<ColorScheme> _getDefaultColorScheme() async {
    const ImageProvider imageProvider = AssetImage(AppResources.placeholder);
    return ColorScheme.fromImageProvider(provider: imageProvider);
  }
}
