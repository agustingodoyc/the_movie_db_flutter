import 'dart:async';

import '../../core/index.dart';
import '../../data/models/movie_preview.dart';
import '../../domain/entities/genre_entity.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/use_cases/implementation/genres_use_case.dart';
import '../../domain/use_cases/implementation/movies_use_case.dart';

class MoviesBloc implements IBloc {
  final GenresUseCase _genresUseCase;
  final MoviesUseCase _moviesUseCase;

  MoviesBloc({
    GenresUseCase? genresUseCase,
    MoviesUseCase? moviesUseCase,
  })  : _genresUseCase = genresUseCase ?? GenresUseCase(),
        _moviesUseCase = moviesUseCase ?? MoviesUseCase();

  final _movies = StreamController<DataState<List<MoviePreview>>>.broadcast();

  Stream<DataState<List<MoviePreview>>> get moviesStream => _movies.stream;

  Future<List<GenreEntity>> _fetchMoviesGenres(List<int> genresId) async {
    List<GenreEntity> movieGenres = [];
    final result = await _genresUseCase.call(params: genresId);
    if (result is DataSuccess) {
      return movieGenres = result.data!;
    } else {
      return movieGenres;
    }
  }

  void _addStateStream(DataState<List<MoviePreview>> result) {
    _movies.sink.add(result);
  }

  Future<void> fetchEndpointsMovies(EndpointEnum endpoint) async {
    List<MovieEntity> movieListEndpoint = [];
    _addStateStream(
      const DataLoading(),
    );
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
          return MoviePreview(movie, movieGenres);
        },
      ).toList();
      _addStateStream(
        DataSuccess(data: moviePreview),
      );
    } else {
      _addStateStream(
        DataFailed(
          error: Exception(ErrorEnum.error),
        ),
      );
    }
  }

  @override
  Future<void> dispose() async {
    _movies.close();
  }

  @override
  Future<void> initialize() async {
  }
}
