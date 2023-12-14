import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/config/index.dart';
import 'src/core/utils/resources/color_scheme_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyHandler dependencyHandler = DependencyHandler();
  await dependencyHandler.initialize();

  runApp(
    Provider(
      create: (BuildContext context) => dependencyHandler,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorScheme _colorScheme = const ColorScheme.light();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        ColorSchemeUtil().colorScheme.then(
              (value) {
            setState(
                  () {
                _colorScheme = value;
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: AppTheme(colorScheme: _colorScheme).lightTheme,
    );
  }
}
