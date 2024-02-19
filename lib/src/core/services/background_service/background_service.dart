import 'dart:async';
import 'package:ct_clean/src/core/services/background_service/background_service_on_start_function.dart';
import 'package:ct_clean/src/core/services/background_service/on_ios_background.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// this will be used as notification channel id
const notificationChannelId = 'my_foreground';
const notificationId = 888;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initializeServices() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
        onStart: BackgroundServiceOnStartFunction.onStart,
        isForegroundMode: true,
        notificationChannelId: notificationChannelId,
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: notificationId),
    iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: BackgroundServiceOnStartFunction.onStart,
        onBackground: onIosBackground),
  );
  service.startService();
}
