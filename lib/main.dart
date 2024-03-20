import 'dart:async';
import 'dart:math';
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
  await CacheHelper.initCacheHelper();
  print(UserLocal.lang);
  print(UserLocal.driverId);
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
  mainDriverId = await CacheHelper.getData(key: MyCashKey.driverId);
  await setUpLocators();
  Bloc.observer = MyBlocObserver();
  await initializeService();
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
  DartPluginRegistrant.ensureInitialized();
  Timer.periodic(const Duration(seconds: 10), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        // int rndmIndex = Random().nextInt(100);
        // AndroidNotificationDetails androidNotificationDetails =
        //     AndroidNotificationDetails(
        //   '$rndmIndex.0',
        //   "Clean Tech",
        //   channelDescription: "This is a channel",
        //   importance: Importance.max,
        //   priority: Priority.high,
        //   showWhen: false,
        // );
        // NotificationDetails platformChannelSpecifics =
        //     NotificationDetails(android: androidNotificationDetails);
        // await flutterLocalNotificationsPlugin.show(
        //   rndmIndex,
        //   "Clean Tech",
        //   "0.0 , 0.0",
        //   platformChannelSpecifics,
        //   payload: 'item x',
        // );
        print("object isForegroundService");
        getLocation();
        callApi();
      } else {
        print("object");
        print("object isBackground");
        getLocation();
        callApi();
        // flutterLocalNotificationsPlugin.show(
        //   notificationId,
        //   'Clean Tech',
        //   'Awesome ${DateTime.now()}',
        //   const NotificationDetails(
        //     android: AndroidNotificationDetails(
        //       notificationChannelId,
        //       'MY FOREGROUND SERVICE',
        //       icon: 'ic_bg_service_small',
        //       ongoing: true,
        //     ),
        //   ),
        // );
      }
    }
  });
}

StreamSubscription<Position> get getterStreamPosition =>
    LocationHelper.getStreamLocation().listen((event) => event);


Position? po;
int? mainDriverId;
void getLocation(){
  LocationHelper.getCurrentLocation().then((value) {
    po = value;

  });
}
void callApi() async {
  await CacheHelper.initCacheHelper();
  Dio dio = Dio();
  if (mainDriverId == null) {
    print("in if $mainDriverId");
    mainDriverId = await CacheHelper.getData(key: MyCashKey.driverId);
  } else {
    print("in else $mainDriverId");
    print("in else point ${po?.latitude}");
    print("in else point ${po?.longitude}");
    if(po == null){
      print("po is null");
      LocationHelper.getCurrentLocation().then((value) {
        po = value;

      });
      print("po is null point ${po?.latitude}");
      print("po is null point ${po?.longitude}");

    }else{
      print("${DateTime.now()} lat is ${po?.latitude} , long is ${po?.longitude}");
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

    // getterPosition.onData((data) {

    // });
  }
}
