import 'dart:async';
import 'dart:ui';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:permission_handler/permission_handler.dart';

const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
const InitializationSettings initializationSettings =
    InitializationSettings(android: androidInitializationSettings);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  notificationChannelId,
  'MY FOREGROUND SERVICE',
  description: 'This channel is used for important notifications.',
  importance: Importance.low,
);
const notificationChannelId = 'my_foreground';
const notificationId = 888;
int? mainDriverId;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCdpqroglUCQHQtfVa49CmGR-fcPTXgCTs",
    appId: "1:641668158562:android:2cad24cbdd3a76c6066d3b",
    messagingSenderId: "641668158562",
    projectId: "publicstorework",
  ));
  await CacheHelper.initCacheHelper();
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
  Bloc.observer = MyBlocObserver();
  mainDriverId = await CacheHelper.getData(key: MyCashKey.driverId);
  await initializeService();
  runApp(MyApp());
}

////////////////////////////////////////BACKGROUND SERVICE////////////////////////////////////////////
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
  DartPluginRegistrant.ensureInitialized();
  Timer.periodic(const Duration(seconds: 10), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        print("object isForegroundService");
        getLocation();
        callApi();
      } else {
        print("object isBackground");
        getLocation();
        callApi();
      }
    }
  });
}

StreamSubscription<Position> get getterStreamPosition =>
    LocationHelper.getStreamLocation().listen((event) => event);

Position? po;

void getLocation() {
  LocationHelper.getCurrentLocation().then((value) {
    po = value;
  });
}

void callApi() async {
  Dio dio = Dio();
  if (mainDriverId == null) {
    print("in if $mainDriverId");
  } else {
    if (po == null) {
      print("po is null");
      LocationHelper.getCurrentLocation().then((value) {
        po = value;
      });
      print("po is null point ${po?.latitude}");
      print("po is null point ${po?.longitude}");
    } else {
      LocationHelper.getCurrentLocation().then((value) {
        po = value;
      });
      print(
          "${DateTime.now()} lat is ${po?.latitude} , long is ${po?.longitude}");
      dio
          .post(
              "http://173.249.51.4/ctservices/location?driverId=${mainDriverId ?? 0}&latitude=${po?.latitude}&longitude=${po?.longitude}&missionId=98")
          .then((value) {
        debugPrint(
            "AhmedTracing:id : $mainDriverId sendLocation ${value.statusCode}latitude=${po?.latitude}&longitude=${po?.longitude}");
        debugPrint("${value.data}");
        debugPrint("${DateTime.now()}");
      }).catchError((e) {
        debugPrint("AhmedTracing: Error is ${e.toString()}");
      });
    }
  }
}
