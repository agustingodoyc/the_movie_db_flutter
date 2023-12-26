import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  void addedFavorite() async {
    String plainTitle = 'Favorite Added';
    String plainBody = 'The movie was added to favorites';
    _showNotification(
      plainTitle,
      plainBody,
    );
  }

  void removedFavorite() async {
    String plainTitle = 'Removed Favorite';
    String plainBody = 'The movie is no longer in favorites';
    _showNotification(
      plainTitle,
      plainBody,
    );
  }

  void _showNotification(
    String plainTitle,
    String plainBody,
  ) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'favorite_notifications_channel_id',
      'Favorite Notifications',
      channelDescription: 'Channel for favorites modification notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await FlutterLocalNotificationsPlugin().show(
      0,
      plainTitle,
      plainBody,
      platformChannelSpecifics,
    );
  }
}
