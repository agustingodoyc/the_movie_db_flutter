/// A class that defines various API routes for the app.
abstract class ApiRoutes {
  // Base URL for the API.
  static const String base = 'https://api.themoviedb.org/3';

  // API key for the API.
  // Consider moving this to a secure storage or configuration file.
  static const String _apiKey = '307592d8ff6e24827ce965948687c709';

  // URL for the API key.
  static const String apiKeyUrl = '?api_key=$_apiKey';

  // Routes for different movie categories.
  static const String movies = '$base/movie/';
  static const String genres = '$base/genre/movie/list$apiKeyUrl';
  static const String popular = 'popular';
  static const String topRated = 'top_rated';
  static const String nowPlaying = 'now_playing';
  static const String upcoming = 'upcoming';

  // URL for images.
  static const String image = 'https://image.tmdb.org/t/p/w500/';
}
