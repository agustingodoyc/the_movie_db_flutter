import 'package:flutter/material.dart';

import '../../../../core/utils/constants/index.dart';
import '../../../../core/utils/enums/page_enum.dart';
import 'drawer_page.dart';
import 'drawer_title.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPaddings.textsLarge,
            horizontal: AppPaddings.textsLarge,
          ),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppPaddings.textsLarge,
                  horizontal: AppPaddings.textsLarge,
                ),
                child: DrawerTitle(title: AppTitles.movies),
              ),
              ...PageEnum.values.map(
                (page) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPaddings.textsShort,
                  ),
                  child: DrawerPage(page: page),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
