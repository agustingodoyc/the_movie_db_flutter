import 'dart:async';

import '../../core/index.dart';
import '../../data/models/movie_preview.dart';
import '../../domain/index.dart';
import 'stream/endpoint_stream.dart';

class MoviesBloc implements IBloc {
  final GenresUseCase _genresUseCase;
  final MoviesUseCase _moviesUseCase;
  final FavoritesUseCase _favoritesUseCase;
  final List<EndpointStream> _endpointStreams = [];
  final List<FavoriteEntity> _favoriteMovies = [];

  MoviesBloc({
    required GenresUseCase genresUseCase,
    required MoviesUseCase moviesUseCase,
    required FavoritesUseCase favoritesUseCase,
  })  : _moviesUseCase = moviesUseCase,
        _genresUseCase = genresUseCase,
        _favoritesUseCase = favoritesUseCase;

  void _createEndpointStream() {
    for (EndpointEnum endpoint in EndpointEnum.values) {
      _endpointStreams.add(
        EndpointStream(endpoint: endpoint),
      );
    }
  }

  Stream<DataState<List<MoviePreview>>> moviesStream(EndpointEnum endpoint) =>
      _endpointStreams
          .where((element) => element.endpoint == endpoint)
          .first
          .moviesStream;

  Future<List<GenreEntity>> _fetchMoviesGenres(List<int> genresId) async {
    final movieGenres = await _genresUseCase.call(params: genresId);
    if (movieGenres is DataSuccess) {
      return movieGenres.data!;
    } else {
      return [];
    }
  }

  Future<void> _fetchFavoriteMovies() async {
    final result = await _favoritesUseCase.call();
    if (result is DataSuccess) {
      _favoriteMovies.addAll(result.data!);
    }
  }

  void _addStateStream(
    DataState<List<MoviePreview>> result,
    EndpointEnum endpoint,
  ) {
    _endpointStreams
        .where((element) => element.endpoint == endpoint)
        .first
        .movies
        .add(result);
  }

  Future<void> fetchMoviesByEndpoint(EndpointEnum endpoint) async {
    List<MovieEntity> movieListEndpoint = [];
    _addStateStream(
      const DataLoading(),
      endpoint,
    );
    try {
      final result = await _moviesUseCase.call(params: endpoint);
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
            final favoriteEntity = FavoriteEntity(id: movie.id);
            return MoviePreview(
              movie: movie,
              genres: movieGenres,
              isFavorite: _favoriteMovies.contains(favoriteEntity),
            );
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

  Future<void> updateFavorite(int id) async {
    _favoriteMovies.clear();
    final result = await _favoritesUseCase.call(params: id);
    if (result is DataSuccess) {
      _favoriteMovies.addAll(result.data!);
    }
  }

  @override
  Future<void> dispose() async {
    _endpointStreams.map(
      (stream) => stream.movies.close(),
    );
  }

  @override
  Future<void> initialize() async {
    await _fetchFavoriteMovies();
    _createEndpointStream();
  }
}
