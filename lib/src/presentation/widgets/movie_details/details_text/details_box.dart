import 'package:flutter/material.dart';

import '../../../../core/utils/constants/index.dart';


class DetailsBox extends StatelessWidget {
  final String releaseDate;
  final String genres;

  const DetailsBox({
    super.key,
    required this.releaseDate,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Theme.of(context).focusColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPaddings.textsShort,
        ),
        child: Column(
          children: [
            Text(
              releaseDate,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Text(
              genres,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
