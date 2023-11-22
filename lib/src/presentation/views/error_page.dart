import 'package:flutter/material.dart';

import '../widgets/general/app_drawer/app_drawer.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Placeholder(),
      ),
      drawer: const AppDrawer(),
    );
  }
}
