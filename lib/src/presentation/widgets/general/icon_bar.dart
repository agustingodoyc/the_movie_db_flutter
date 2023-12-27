import 'package:flutter/material.dart';

import '../../../core/utils/constants/index.dart';


class IconBar extends StatelessWidget implements PreferredSizeWidget{
  const IconBar({super.key});

  static const double iconPadding = AppPaddings.icon;

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: SizedBox(
          height: iconPadding,
          child: Padding(
            padding: const EdgeInsets.only(right: iconPadding),
            child: Image.asset(
              AppResources.icon,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
