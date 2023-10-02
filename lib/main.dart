import 'package:flutter/material.dart';

import 'routes/movie_details.dart';
import 'routes/movie_list.dart';
import 'utils/route_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RouteConstants.listRoute: (context) => const MovieList(),
        RouteConstants.movieRoute: (context) => const MovieDetails(),
      },
      initialRoute: RouteConstants.listRoute,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue.shade900,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue.shade900,
          background: Colors.blue.shade900,
        ),
      ),
    );
  }
}
