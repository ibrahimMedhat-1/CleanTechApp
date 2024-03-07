import 'dart:async';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/services/background_service/show_notification.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerBackgroundServiceToSend {
  static Timer timerTOSendLocation(ServiceInstance service) {
    return Timer.periodic(const Duration(seconds: 50), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          debugPrint("AhmedTracing: Foreground Mode");
          service.setForegroundNotificationInfo(
            title: "App in foreground...",
            content: "Update ${DateTime.now()}",
          );
          // Make Anything you want
          sendLocation();
          // showNotification();
        } else {
          debugPrint("AhmedTracing: Background Mode");
          service.setForegroundNotificationInfo(
            title: "App in background...",
            content: "Update ${DateTime.now()}",
          );
          // Make Anything you want
          sendLocation();
        }
      }
      // perform some operation on background
      debugPrint("AhmedTracing: Update ${DateTime.now()}");
      service.invoke(
        'update',
        {"current_date": DateTime.now().toIso8601String()},
      );
    });
  }

  static void sendLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    LocationHelper.getCurrentLocation().then((positionValue) {
      Dio dio = Dio();
      dio
          .post(EndPoint.sendLocationFullLink(
        position: positionValue,
        missionId: prefs.getInt(MyCashKey.missionId.name) ?? 0,
        driverId: prefs.getInt(MyCashKey.driverId.name) ?? 0,
      ))
          .then((value) {
        debugPrint(
            "AhmedTracing: sendLocation ${value.statusCode} , ${positionValue.latitude} , ${positionValue.longitude} ");
        debugPrint("${value.data}");
        debugPrint("${MyCashKey.driverId}");
        // showNotification(
        //     location: "${positionValue.latitude} , ${positionValue.longitude}");
      }).catchError((e) {
        debugPrint("AhmedTracing: sendLocation Error is ${e.toString()}");
      });
    });
  }
}
