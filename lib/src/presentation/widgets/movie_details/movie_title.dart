import 'package:flutter/material.dart';

import '../../../core/utils/constants/index.dart';


class MovieTitle extends StatelessWidget {
  final String title;
  final String releaseDate;

  const MovieTitle({
    super.key,
    required this.title,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    String year = ' (${releaseDate.substring(0, 4)})';

    double padding = AppPaddings.textsLarge;
    Color textColor = Theme.of(context).colorScheme.onPrimary;
    Color lessOpacityColor = textColor.withOpacity(0.6);
    FontWeight fontWeight = FontWeight.w500;
    return Padding(
      padding: EdgeInsets.only(
        top: padding,
        left: padding,
        right: padding,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                color: textColor,
                fontSize: FontSizes.title,
                fontWeight: fontWeight,
              ),
            ),
            TextSpan(
              text: year,
              style: TextStyle(
                color: lessOpacityColor,
                fontSize: FontSizes.heading,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
