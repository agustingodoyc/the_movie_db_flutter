import 'package:flutter/material.dart';

import '../../../../core/utils/constants/index.dart';
import '../../../../core/utils/enums/page_enum.dart';

class PageNavigator extends StatelessWidget {
  const PageNavigator({
    super.key,
    required this.page,
  });

  final PageEnum page;

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
      child: const Icon(Icons.arrow_forward_ios),
    );
  }
}
