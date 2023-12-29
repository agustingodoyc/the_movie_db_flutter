import 'package:flutter/material.dart';

import '../widgets/general/index.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: IconBar(),
      body: SafeArea(
        child: Placeholder(),
      ),
      drawer: AppDrawer(),
    );
  }
}
