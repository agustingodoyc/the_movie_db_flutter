import 'package:flutter/material.dart';

import '../../../../core/utils/index.dart';
import '../../../../data/models/movie_preview.dart';
import '../../../blocs/movies_bloc.dart';
import 'row_card/row_card.dart';

class MoviesRow extends StatefulWidget {
  final EndpointEnum endpoint;
  final MoviesBloc moviesBloc;

  const MoviesRow({
    super.key,
    required this.endpoint,
    required this.moviesBloc,
  });

  @override
  State<MoviesRow> createState() => _MoviesRowState();
}

class _MoviesRowState extends State<MoviesRow> {
  final int itemCount = 10;
  final double height = 300;

  @override
  void initState() {
    widget.moviesBloc.fetchEndpointsMovies(widget.endpoint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.moviesBloc.moviesStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<DataState<List<MoviePreview>>> snapshot,
      ) {
        if (snapshot.hasData) {
          if (snapshot.data is DataSuccess) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: height,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  final payload = snapshot.data!.data![index];
                  return RowCard(payload: payload);
                },
              ),
            );
          } else {
            if (snapshot.data is DataFailed) {
              return Text(
                snapshot.data!.error.toString(),
              );
            } else {
              return Center(
                child: Text(ErrorEnum.empty.message),
              );
            }
          }
        } else {
          if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
    );
  }
}
