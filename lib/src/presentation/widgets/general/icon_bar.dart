import 'package:flutter/material.dart';

class IconBar extends StatelessWidget implements PreferredSizeWidget{
  const IconBar({super.key});

  static const double iconHeight = 40.0;
  static const String assetRoute = 'assets/images/app_icon.png';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: SizedBox(
          height: iconHeight,
          child: Padding(
            padding: const EdgeInsets.only(right: iconHeight),
            child: Image.asset(
              assetRoute,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
