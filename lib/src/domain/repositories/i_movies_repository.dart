import '../../core/utils/enums/endpoint_enum.dart';
import '../../core/utils/resources/data_state.dart';
import '../../data/models/result.dart';

abstract class IMoviesRepository {
  Future<DataState<Result>> fetchMovies(EndpointEnum endpoint);
}
