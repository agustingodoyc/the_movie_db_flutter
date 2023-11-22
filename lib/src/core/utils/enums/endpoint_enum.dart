import '../constants/routes/api_routes.dart';

enum EndpointEnum {
  popular(ApiRoutes.popular),
  topRated(ApiRoutes.topRated),
  nowPlaying(ApiRoutes.nowPlaying),
  upcoming(ApiRoutes.upcoming);

  const EndpointEnum(this.endpoint);

  final String endpoint;
}
