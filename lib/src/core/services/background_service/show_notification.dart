// show notification Function
import 'dart:math';

import 'package:ct_clean/src/core/services/background_service/background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> showNotification({String? location}) async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    notificationChannelId, // id
    'MY FOREGROUND SERVICE', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  int rndmIndex = Random().nextInt(100);
  AndroidNotificationDetails androidNotificationDetails =
  AndroidNotificationDetails(
    '$rndmIndex.0',
    "AhmedApp",
    channelDescription: 'تطبيق اذكار وادعية وتلاوة وقراءة القرءان الكريم',
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