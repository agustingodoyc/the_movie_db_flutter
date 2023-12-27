import '../constants/notification_texts.dart';

enum FavoriteEvent {
  add(
    NotificationTexts.addTitle,
    NotificationTexts.addBody,
  ),
  remove(
    NotificationTexts.removeTitle,
    NotificationTexts.removeBody,
  );

  const FavoriteEvent(
    this.title,
    this.body,
  );

  final String title;
  final String body;
}
