import 'package:flutter/material.dart';

import '../../../../core/utils/constants/index.dart';


class DrawerTitle extends StatelessWidget {
  final String title;

  const DrawerTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          NavigationRoutes.home,
        );
      },
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
          fontSize: FontSizes.heading,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
