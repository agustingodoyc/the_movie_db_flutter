import 'movie_model.dart';

class Result {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  const Result({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      page: json['page'],
      results: List.from(
        json['results'],
      )
          .map(
            (e) => MovieModel.fromJson(e),
          )
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
