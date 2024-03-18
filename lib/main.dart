// import 'dart:async';
// import 'dart:math';
// import 'dart:ui';
//
// import 'package:ct_clean/src/core/config/routes/app_imports.dart';
// import 'package:ct_clean/src/core/services/background_service/background_service.dart';
// import 'package:ct_clean/src/core/services/background_service/timer_background_service_to_send.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// const AndroidInitializationSettings androidInitializationSettings =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
// const InitializationSettings initializationSettings =
//     InitializationSettings(android: androidInitializationSettings);
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   notificationChannelId, // id
//   'MY FOREGROUND SERVICE', // title
//   description:
//       'This channel is used for important notifications.', // description
//   importance: Importance.low, // importance must be at low or higher level
// );
// const notificationChannelId = 'my_foreground';
// const notificationId = 888;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//   await Permission.notification.isDenied.then((value) {
//     if (value) {
//       Permission.notification.request();
//       LocationHelper().getPermissionLocation();
//     }
//   });
//   await Permission.location.isDenied.then((value) {
//     if (value) {
//       LocationHelper().getPermissionLocation();
//     }
//   });
//   await Permission.storage.isDenied.then((value) {
//     if (value) {
//       Permission.storage.request();
//     }
//   });
//
//   await setUpLocators();
//   await CacheHelper.initCacheHelper();
//   print(UserLocal.lang);
//   print(UserLocal.driverId);
//   Bloc.observer = MyBlocObserver();
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//   // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   //     FlutterLocalNotificationsPlugin();
//   // const AndroidInitializationSettings androidInitializationSettings =
//   //     AndroidInitializationSettings('@mipmap/ic_launcher');
//   // const InitializationSettings initializationSettings =
//   //     InitializationSettings(android: androidInitializationSettings);
//   // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   // TimerBackgroundServiceToSend().getCurrentLocation();
//   // await initializeServices(); //setAsBackground // setAsForeground
//   // FlutterBackgroundService().invoke("setAsBackground");
//   runApp(MyApp());
// }
//
// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//
//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,
//       autoStart: true,
//       isForegroundMode: true,
//       notificationChannelId: notificationChannelId,
//       initialNotificationTitle: 'AWESOME SERVICE',
//       initialNotificationContent: 'Initializing',
//       foregroundServiceNotificationId: notificationId,
//     ),
//     iosConfiguration: IosConfiguration(
//       autoStart: true,
//       onForeground: onStart,
//       onBackground: onIosBackground,
//     ),
//   );
// }
//
// @pragma('vm:entry-point')
// FutureOr<bool> onIosBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();
//   return true;
// }
//
// @pragma('vm:entry-point')
// Future<void> onStart(ServiceInstance service) async {
//    DartPluginRegistrant.ensureInitialized();
//   Timer.periodic(const Duration(seconds: 10), (timer) async {
//     if (service is AndroidServiceInstance) {
//       if (await service.isForegroundService()) {
//         int rndmIndex = Random().nextInt(100);
//         AndroidNotificationDetails androidNotificationDetails =
//             AndroidNotificationDetails(
//           '$rndmIndex.0',
//           "Clean Tech",
//           channelDescription: "This is a channel",
//           importance: Importance.max,
//           priority: Priority.high,
//           showWhen: false,
//         );
//         NotificationDetails platformChannelSpecifics =
//             NotificationDetails(android: androidNotificationDetails);
//         await flutterLocalNotificationsPlugin.show(
//           rndmIndex,
//           "Clean Tech",
//           "${position?.latitude} , ${position?.longitude}",
//           platformChannelSpecifics,
//           payload: 'item x',
//         );
//         print("object isForegroundService");
//         // callApi();
//         TimerBackgroundServiceToSend().getCurrentLocation();
//         TimerBackgroundServiceToSend().sendLocation();
//       } else {
//         print("object");
//         // callApi();
//
//         flutterLocalNotificationsPlugin.show(
//           notificationId,
//           'COOL SERVICE',
//           'Awesome ${DateTime.now()}',
//           const NotificationDetails(
//             android: AndroidNotificationDetails(
//               notificationChannelId,
//               'MY FOREGROUND SERVICE',
//               icon: 'ic_bg_service_small',
//               ongoing: true,
//             ),
//           ),
//         );
//         TimerBackgroundServiceToSend().getCurrentLocation();
//         TimerBackgroundServiceToSend().sendLocation();
//       }
//     }
//   });
// }

import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/services/background_service/timer_background_service_to_send.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

const AndroidInitializationSettings androidInitializationSettings =
AndroidInitializationSettings('@mipmap/ic_launcher');
const InitializationSettings initializationSettings =
InitializationSettings(android: androidInitializationSettings);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  notificationChannelId, // id
  'MY FOREGROUND SERVICE', // title
  description:
  'This channel is used for important notifications.', // description
  importance: Importance.low, // importance must be at low or higher level
);
const notificationChannelId = 'my_foreground';
const notificationId = 888;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await Permission.location.isDenied.then((value) {
    if (value) {
      LocationHelper().getPermissionLocation();
    }
  });
  await Permission.storage.isDenied.then((value) {
    if (value) {
      Permission.storage.request();
    }
  });
  await setUpLocators();
  await CacheHelper.initCacheHelper();
  print(UserLocal.lang);
  print(UserLocal.driverId);
  Bloc.observer = MyBlocObserver();
  await initializeService();
  // TimerBackgroundServiceToSend().getCurrentLocation();

  runApp(MyApp());
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
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
}

@pragma('vm:entry-point')
FutureOr<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
Future<void> onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  // bring to foreground
  Timer.periodic(const Duration(seconds: 10), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
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
          "0.0 , 0.0",
          platformChannelSpecifics,
          payload: 'item x',
        );

        print("object isForegroundService");
        // callApi();
        // TimerBackgroundServiceToSend().getCurrentLocation();
        // TimerBackgroundServiceToSend().sendLocation();

        sendLocation();
      } else {
        print("object");
        // callApi();
        // TimerBackgroundServiceToSend().getCurrentLocation();
        // TimerBackgroundServiceToSend().sendLocation();
        sendLocation();
        flutterLocalNotificationsPlugin.show(
          notificationId,
          'COOL SERVICE',
          'Awesome ${DateTime.now()}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              notificationChannelId,
              'MY FOREGROUND SERVICE',
              icon: 'ic_bg_service_small',
              ongoing: true,
            ),
          ),
        );
      }
    }
  });
}

StreamSubscription<Position> get getterPosition =>
    LocationHelper.getStreamLocation().listen((event) => event);
Position? po;

void sendLocation() async {
  await CacheHelper.initCacheHelper();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // double lat = await position.latitude;
  // final box = GetStorage();
  // position.then((value) {
  //   positionValue = LatLng(value.latitude, value.longitude);
  //
  // });
  // LocationHelper.getStreamLocation().listen((event) {
  //   positionValue = LatLng(event.latitude, event.longitude);
  //   // print("lat : ${event.latitude}, lng : ${event.longitude} ");
  // });

  int driverId =
  // box.read(MyCashKey.driverId.name) ?? 0;
  prefs.getInt(MyCashKey.driverId.name) ?? 0;
  if (driverId == 0) {
    driverId = prefs.getInt(MyCashKey.driverId.name) ?? 0;
    print("*** ${UserLocal.driverId} ***");
    // SystemNavigator.pop();
    // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  getterPosition.onData((data) {
    po = data;
  });

  Dio dio = Dio();
  dio
      .post(EndPoint.sendLocationFullLink(
  position:po == null ? LatLng(0.0, 0.0) : LatLng(po?.latitude ?? 0.0, po?.longitude ?? 0.0),
  missionId: prefs.getInt(MyCashKey.missionId.name) ?? 0,
  driverId: UserLocal.driverId ?? 0,
  ))
      .then((value) {
  debugPrint(
  "AhmedTracing: sendLocation ${value.statusCode} , ${po?.latitude} , ${po?.longitude} ");
  debugPrint("${value.data}");
  print("The generalDriverId is ${UserLocal.driverId ?? 0}");
  }).catchError((e) {
  debugPrint("AhmedTracing: sendLocation Error is ${e.toString()}");
  });
}

// void callApi() async {
//   Dio dio = Dio();
//   dio
//       .post(
//           "http://173.249.51.4/ctservices/location?driverId=4&latitude=0.0&longitude=0.0&missionId=98")
//       .then((value) {
//     debugPrint("AhmedTracing: sendLocation ${value.statusCode}");
//     debugPrint("${value.data}");
//     debugPrint("${DateTime.now()}");
//     // showNotification(
//     //     location: "${positionValue?.latitude} , ${positionValue?.longitude}");
//   }).catchError((e) {
//     debugPrint("AhmedTracing: Error is ${e.toString()}");
//   });
// }
