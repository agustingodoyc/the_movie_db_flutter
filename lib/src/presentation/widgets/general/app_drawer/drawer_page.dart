import 'package:flutter/material.dart';

import '../../../../core/utils/constants/index.dart';
import '../../../../core/utils/enums/page_enum.dart';

class DrawerPage extends StatelessWidget {
  final PageEnum page;

  const DrawerPage({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            NavigationRoutes.page,
            arguments: page,
          );
        },
        child: ListTile(
          title: Text(page.pageTitle),
          titleTextStyle:
              TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
    );
  }
}
