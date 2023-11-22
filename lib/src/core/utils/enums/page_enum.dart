import '../index.dart';

enum PageEnum {
  popular(
    AppTitles.popular,
    EndpointEnum.popular,
  ),
  topRated(
    AppTitles.topRated,
    EndpointEnum.topRated,
  ),
  nowPlaying(
    AppTitles.nowPlaying,
    EndpointEnum.nowPlaying,
  ),
  upcoming(
    AppTitles.upcoming,
    EndpointEnum.upcoming,
  );

  const PageEnum(
    this.pageTitle,
    this.endpoint,
  );

  final String pageTitle;
  final EndpointEnum endpoint;
}
