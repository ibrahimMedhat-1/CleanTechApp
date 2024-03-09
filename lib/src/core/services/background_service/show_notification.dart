import 'dart:math';
import 'package:ct_clean/src/core/services/background_service/background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> showNotification({String? location}) async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    notificationChannelId,
    'MY FOREGROUND SERVICE',
    description: 'This channel is used for important notifications.',
    importance: Importance.low,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  int rndmIndex = Random().nextInt(100);
  AndroidNotificationDetails androidNotificationDetails =
  AndroidNotificationDetails(
    '$rndmIndex.0',
    "Clean Tech",
    channelDescription: "This is a channel",
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );
  NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin.show(
    rndmIndex,
    "Clean Tech",
    location ?? "0.0 , 0.0",
    platformChannelSpecifics,
    payload: 'item x',
  );
}