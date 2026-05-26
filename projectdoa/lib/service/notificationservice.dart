import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {

  static final notifications =
      FlutterLocalNotificationsPlugin();

  static Future init() async {

    const android =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const settings =
        InitializationSettings(android: android);

    await notifications.initialize(settings);
  }

  static Future showNotification({
    required String title,
    required String body,
  }) async {

    const android = AndroidNotificationDetails(
      'adzan_channel',
      'Adzan Notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const detail = NotificationDetails(
      android: android,
    );

    await notifications.show(
      0,
      title,
      body,
      detail,
    );
  }
}