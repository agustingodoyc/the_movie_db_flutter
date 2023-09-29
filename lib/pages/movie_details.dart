import 'package:flutter/material.dart';

import '../widgets/focus_box.dart';
import '../widgets/like_button.dart';
import '../widgets/movie_header.dart';
import '../widgets/movie_overview.dart';
import '../widgets/movie_title.dart';
import '../widgets/vote_average.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
