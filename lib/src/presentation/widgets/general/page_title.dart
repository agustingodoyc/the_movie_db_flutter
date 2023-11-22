import 'package:flutter/material.dart';

import '../../../core/utils/constants/index.dart';


class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPaddings.textsShort,
        horizontal: AppPaddings.textsLarge,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: FontSizes.heading,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
