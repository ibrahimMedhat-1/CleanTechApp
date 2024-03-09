import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/services/background_service/background_service.dart';
import 'package:ct_clean/src/core/services/background_service/timer_background_service_to_send.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
      LocationHelper().getPermissionLocation();
    }
  });
  await Permission.location.isDenied.then((value) {
    if (value) {
      LocationHelper().getPermissionLocation();
    }
  });
  await await Permission.storage.isDenied.then((value) {
    if (value) {
      Permission.storage.request();
    }
  });

  await setUpLocators();
  await CacheHelper.initCacheHelper();
  print(UserLocal.lang);
  print(UserLocal.driverId);
  Bloc.observer = MyBlocObserver();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: androidInitializationSettings);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  TimerBackgroundServiceToSend().getCurrentLocation();
  await initializeServices(); //setAsBackground // setAsForeground
  FlutterBackgroundService().invoke("setAsForeground");
  runApp(MyApp());
}
