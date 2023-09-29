import 'package:flutter/material.dart';
import '../widgets/focus_box.dart';
import '../widgets/like_button.dart';
import '../widgets/movie_header.dart';
import '../widgets/movie_overview.dart';
import '../widgets/movie_title.dart';
import '../widgets/vote_average.dart';

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
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: const [
                  MovieHeader(),
                  MovieTitle(),
                  VoteAverage(),
                  FocusBox(),
                  MovieOverview(),
                  LikeButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
