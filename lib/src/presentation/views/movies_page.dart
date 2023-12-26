import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/dependency_handler.dart';
import '../../core/utils/index.dart';
import '../blocs/movies_bloc.dart';
import '../widgets/index.dart';

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
    _moviesBloc = Provider.of<DependencyHandler>(
      context,
      listen: false,
    ).moviesBloc;
  }

  @override
  Widget build(BuildContext context) {
    final PageEnum pageEnum = widget.pageEnum;
    return Scaffold(
      appBar: const IconBar(),
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
