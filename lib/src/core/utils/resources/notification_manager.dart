import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../constants/index.dart';
import '../enums/favorite_event.dart';

class NotificationManager {
  void addedFavorite(int movieId) async {
    _showNotification(
      FavoriteEvent.add,
      movieId,
    );
  }

  void removedFavorite(int movieId) async {
    _showNotification(
      FavoriteEvent.remove,
      movieId,
    );
  }

  void _showNotification(
    FavoriteEvent event,
    int movieId,
  ) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      NotificationTexts.channelId,
      NotificationTexts.channelName,
      channelDescription: NotificationTexts.channelDescription,
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await FlutterLocalNotificationsPlugin().show(
      movieId,
      event.title,
      event.body,
      platformChannelSpecifics,
    );
  }
}
