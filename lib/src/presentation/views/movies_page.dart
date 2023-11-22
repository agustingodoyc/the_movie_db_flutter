import 'package:flutter/material.dart';

import '../../core/utils/enums/page_enum.dart';
import '../blocs/movies_bloc.dart';
import '../widgets/general/app_drawer/app_drawer.dart';
import '../widgets/general/page_title.dart';
import '../widgets/movie_page/movies_column.dart';

class MoviesPage extends StatefulWidget {
  final PageEnum pageEnum;

  const MoviesPage({
    super.key,
    required this.pageEnum,
  });

  @override
  State<StatefulWidget> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late MoviesBloc _moviesBloc;

  @override
  void initState() {
    super.initState();
    _moviesBloc = MoviesBloc();
  }

  @override
  Widget build(BuildContext context) {
    final PageEnum pageEnum = widget.pageEnum;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(title: pageEnum.pageTitle),
            Expanded(
              child: MoviesColumn(
                endpoint: pageEnum.endpoint,
                moviesBloc: _moviesBloc,
              ),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
