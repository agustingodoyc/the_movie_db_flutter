import 'dart:async';

import '../../../core/utils/enums/endpoint_enum.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../../data/models/movie_preview.dart';

class EndpointStream {
  final movies = StreamController<DataState<List<MoviePreview>>>.broadcast();

  Stream<DataState<List<MoviePreview>>> get moviesStream => movies.stream;
  final EndpointEnum endpoint;

  EndpointStream({required this.endpoint});
}
