// import 'dart:async';
// import 'dart:math';
// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// const notificationChannelId = 'my_foreground';
// const notificationId = 888;
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// const AndroidInitializationSettings androidInitializationSettings =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
// const InitializationSettings initializationSettings =
//     InitializationSettings(android: androidInitializationSettings);
//
// class BackgroundServiceService {
//   BackgroundServiceService._singleton();
//
//   static final BackgroundServiceService _instance =
//       BackgroundServiceService._singleton();
//
//   static BackgroundServiceService get instance => _instance;
//
//   Future<void> initializeServices(
//       {required dynamic Function(ServiceInstance) onForeground}) async {
//     final service = FlutterBackgroundService();
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       notificationChannelId, // id
//       'MY FOREGROUND SERVICE', // title
//       description:
//           'This channel is used for important notifications.', // description
//       importance: Importance.low, // importance must be at low or higher level
//     );
//
//     //**// Call BackGround Service Config
//     await backGroundServiceConfig(
//       service: service,
//       onForeground: onForeground,
//     );
//     service.startService();
//   }
//
//   Future<bool> backGroundServiceConfig(
//       {required FlutterBackgroundService service,
//       required dynamic Function(ServiceInstance) onForeground}) async {
//     return await service.configure(
//       androidConfiguration: AndroidConfiguration(
//         onStart: onForeground,
//         autoStart: true,
//         isForegroundMode: true,
//         notificationChannelId: notificationChannelId,
//         // this must match with notification channel you created above.
//         initialNotificationTitle: 'AWESOME SERVICE',
//         initialNotificationContent: 'Initializing',
//         foregroundServiceNotificationId: notificationId,
//       ),
//       iosConfiguration: IosConfiguration(
//         autoStart: true,
//         onForeground: onForeground,
//         onBackground: onIosBackground,
//       ),
//     );
//   }
//
// // Call BackGround Service in IOS
//   @pragma('vm:entry-point')
//   FutureOr<bool> onIosBackground(ServiceInstance service) async {
//     WidgetsFlutterBinding.ensureInitialized();
//     DartPluginRegistrant.ensureInitialized();
//     return true;
//   }
//
// // Call Background Service in Android
// }

import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// this will be used as notification channel id
const notificationChannelId = 'my_foreground';
const notificationId = 888;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initializeServices() async {
  final service = FlutterBackgroundService();
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
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      notificationChannelId: notificationChannelId,
      // this must match with notification channel you created above.
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: notificationId,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
  service.startService();
}

// FutureOr<bool> Function(ServiceInstance)? onBackground
@pragma('vm:entry-point')
FutureOr<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  Timer.periodic(const Duration(seconds: 10), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        print("AhmedTracing: Foreground Mode");
        service.setForegroundNotificationInfo(
          title: "App in foreground...",
          content: "Update ${DateTime.now()}",
        );
        // showNotification();

      } else {
        print("AhmedTracing: Background Mode");
        service.setForegroundNotificationInfo(
          title: "App in background...",
          content: "Update ${DateTime.now()}",
        );
        // showNotification();
      }
    }
    // perform some operation on background
    print("AhmedTracing: Update ${DateTime.now()}");
    service.invoke(
      'update',
      {"current_date": DateTime.now().toIso8601String()},
    );
  });
}

// show notification Function
Future<void> showNotification() async {
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
    'AhmedApp',
    "AhmedApp",
    platformChannelSpecifics,
    payload: 'item x',
  );
}
