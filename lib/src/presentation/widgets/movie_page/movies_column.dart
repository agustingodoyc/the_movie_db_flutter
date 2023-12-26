import 'package:flutter/material.dart';

import '../../../core/index.dart';
import '../../blocs/movies_bloc.dart';
import 'column_card/column_card.dart';

class MoviesColumn extends StatefulWidget {
  final EndpointEnum endpoint;
  final MoviesBloc moviesBloc;

  const MoviesColumn({
    super.key,
    required this.endpoint,
    required this.moviesBloc,
  });

  @override
  State<MoviesColumn> createState() => _MoviesColumnState();
}

class _MoviesColumnState extends State<MoviesColumn> {
  @override
  void initState() {
    widget.moviesBloc.fetchMoviesByEndpoint(widget.endpoint);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: widget.moviesBloc.moviesStream(widget.endpoint),
          builder: (
            context,
            snapshot,
          ) {
            if (snapshot.hasData) {
              if (snapshot.data is DataSuccess) {
                return ListView.builder(
                  itemCount: snapshot.data?.data?.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    final payload = snapshot.data!.data![index];
                    return ColumnCard(payload: payload);
                  },
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
        ),
      ),
    );
  }
}
