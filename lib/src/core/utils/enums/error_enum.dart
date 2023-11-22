import '../constants/app_titles.dart';

enum ErrorEnum {
  error(AppTitles.error),
  empty(AppTitles.empty),
  other(AppTitles.other);

  const ErrorEnum(this.message);

  final String message;
}
