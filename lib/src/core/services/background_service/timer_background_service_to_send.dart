import 'dart:async';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/services/background_service/show_notification.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerBackgroundServiceToSend {

  //
  // Timer timerTOSendLocation(ServiceInstance service) {
  //   return Timer.periodic(const Duration(seconds: 60), (timer) async {
  //     if (service is AndroidServiceInstance) {
  //       if (await service.isForegroundService()) {
  //         debugPrint("AhmedTracing: Foreground Mode");
  //         service.setForegroundNotificationInfo(
  //           title: "App in foreground...",
  //           content: "Update ${DateTime.now()}",
  //         );
  //
  //         // Make Anything you want
  //         // getCurrentLocation();
  //         sendLocation();
  //       } else {
  //         debugPrint("AhmedTracing: Background Mode");
  //         service.setForegroundNotificationInfo(
  //           title: "App in background...",
  //           content: "Update ${DateTime.now()}",
  //         );
  //         // Make Anything you want
  //         // getCurrentLocation();
  //         sendLocation();
  //       }
  //     }
  //     // perform some operation on background
  //     debugPrint("AhmedTracing: Update ${DateTime.now()}");
  //     service.invoke(
  //       'update',
  //       {"current_date": DateTime.now().toIso8601String()},
  //     );
  //   });
  // }

  LatLng? positionValue;

  void getCurrentLocation() async {
    LocationHelper.getStreamLocation().listen((event) {
      positionValue = LatLng(event.latitude, event.longitude);
      // print("lat : ${event.latitude}, lng : ${event.longitude} ");
    });
  }

  // Future<Position> get position => LocationHelper.getCurrentLocation();

  void sendLocation() async {
    getCurrentLocation();
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

    Dio dio = Dio();
    dio
        .post(EndPoint.sendLocationFullLink(
      position: positionValue ?? const LatLng(0.0, 0.0),
      missionId: prefs.getInt(MyCashKey.missionId.name) ?? 0,
      driverId: UserLocal.driverId ?? 0,
    ))
        .then((value) {
      debugPrint(
          "AhmedTracing: sendLocation ${value.statusCode} , ${positionValue?.latitude} , ${positionValue?.longitude} ");
      debugPrint("${value.data}");
      print("The generalDriverId is ${ UserLocal.driverId ?? 0}");
    }).catchError((e) {
      debugPrint("AhmedTracing: sendLocation Error is ${e.toString()}");
    });
  }
}
