import 'dart:async';

import '../../core/index.dart';
import '../../data/models/movie_preview.dart';
import '../../domain/index.dart';
import 'stream/endpoint_stream.dart';

class MoviesBloc implements IBloc {
  final GenresUseCase genresUseCase;
  final MoviesUseCase moviesUseCase;
  final List<EndpointStream> endpointStreams = [];

  MoviesBloc({
    required this.genresUseCase,
    required this.moviesUseCase,
  });

  void _createEndpointStream() {
    for (EndpointEnum endpoint in EndpointEnum.values) {
      endpointStreams.add(
        EndpointStream(endpoint: endpoint),
      );
    }
  }

  Stream<DataState<List<MoviePreview>>> moviesStream(EndpointEnum endpoint) =>
      endpointStreams
          .where((element) => element.endpoint == endpoint)
          .first
          .moviesStream;

  Future<List<GenreEntity>> _fetchMoviesGenres(List<int> genresId) async {
    List<GenreEntity> movieGenres = [];
    final result = await genresUseCase.call(params: genresId);
    if (result is DataSuccess) {
      return movieGenres = result.data!;
    } else {
      return movieGenres;
    }
  }

  void _addStateStream(
    DataState<List<MoviePreview>> result,
    EndpointEnum endpoint,
  ) {
    endpointStreams
        .where((element) => element.endpoint == endpoint)
        .first
        .movies
        .sink
        .add(result);
  }

  Future<void> fetchEndpointsMovies(EndpointEnum endpoint) async {
    List<MovieEntity> movieListEndpoint = [];
    _addStateStream(
      const DataLoading(),
      endpoint,
    );
    try {
      final result = await moviesUseCase.call(params: endpoint);
      if (result is DataSuccess) {
        movieListEndpoint = result.data ?? [];
        List<GenreEntity> genres = await _fetchMoviesGenres(
          movieListEndpoint
              .map((movie) => movie.genreIds)
              .expand((element) => element)
              .toList(),
        );
        List<MoviePreview> moviePreview = movieListEndpoint.map(
          (movie) {
            final movieGenres = genres
                .where(
                  (genre) => movie.genreIds.contains(genre.id),
                )
                .toList();
            return MoviePreview(movie, movieGenres);
          },
        ).toList();
        _addStateStream(
          DataSuccess(data: moviePreview),
          endpoint,
        );
      } else {
        _addStateStream(
          DataFailed(
            error: Exception(ErrorEnum.error),
          ),
          endpoint,
        );
      }
    } catch (e) {
      return _addStateStream(
        DataFailed(
          error: Exception(e),
        ),
        endpoint,
      );
    }
  }

  @override
  Future<void> dispose() async {
    endpointStreams.map((stream) => stream.movies.close());
  }

  @override
  Future<void> initialize() async {
    _createEndpointStream();
  }
}
