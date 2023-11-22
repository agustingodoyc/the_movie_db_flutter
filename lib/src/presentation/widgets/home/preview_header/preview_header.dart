import 'package:flutter/material.dart';

import '../../../../core/utils/enums/page_enum.dart';
import '../../general/page_title.dart';
import 'page_navigator.dart';

class PreviewHeader extends StatelessWidget {
  const PreviewHeader({
    super.key,
    required this.page,
  });

  final PageEnum page;
  static const double rightPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: PageTitle(title: page.pageTitle),
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: rightPadding),
              child: PageNavigator(page: page),
            ),
          ),
        ),
      ],
    );
  }
}
