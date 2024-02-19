import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/services/background_service/background_service.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
      LocationHelper().getPermissionLocation();
    }
  });
  await setUpLocators();
  await CacheHelper.initCacheHelper();
  print(UserLocal.lang);
  Bloc.observer = MyBlocObserver();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: androidInitializationSettings);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await initializeServices();
  FlutterBackgroundService().invoke("setAsForeground");
  runApp(MyApp());
}
