import 'package:flutter/material.dart';
import 'package:the_movie_db_flutter/pages/movie_details.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.deepOrange.shade900,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange.shade900,
          background: Colors.deepOrange.shade900,
        ),
      ),
      home: const MovieDetails(),
    );
  }
}
