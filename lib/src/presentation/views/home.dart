import 'package:flutter/material.dart';

import '../../core/utils/index.dart';
import '../widgets/index.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IconBar(),
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
