import 'package:flutter/material.dart';
import '../constants/ui_constants.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({super.key});

  static const backdropHeight = 250.0;
  static const imageBackdrop = 'assets/images/Backdrop.jpg';
  static const imagePoster = 'assets/images/Poster.jpg';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: backdropHeight,
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: UIConstants.backdropLeftPadding),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(imageBackdrop),
              height: double.infinity,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: UIConstants.backdropLeftPadding),
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
          const Padding(
            padding: EdgeInsets.all(UIConstants.imagePadding),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(imagePoster),
            ),
          ),
        ],
      ),
    );
  }
}
