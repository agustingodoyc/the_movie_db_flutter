import 'package:flutter/material.dart';

import '../../core/utils/enums/page_enum.dart';
import '../widgets/general/app_drawer/app_drawer.dart';
import '../widgets/home/page_preview.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            ...PageEnum.values.map(
              (e) => PagePreview(page: e),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
