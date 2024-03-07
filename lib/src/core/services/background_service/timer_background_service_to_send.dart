import 'dart:async';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/services/background_service/show_notification.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

class TimerBackgroundServiceToSend {
  static Timer timerTOSendLocation(ServiceInstance service) {
    return Timer.periodic(const Duration(minutes: 1), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          debugPrint("AhmedTracing: Foreground Mode");
          service.setForegroundNotificationInfo(
            title: "App in foreground...",
            content: "Update ${DateTime.now()}",
          );
          // Make Anything you want
          sendLocation();
          showNotification();
        } else {
          debugPrint("AhmedTracing: Background Mode");
          service.setForegroundNotificationInfo(
            title: "App in background...",
            content: "Update ${DateTime.now()}",
          );
          // Make Anything you want
          sendLocation();
          showNotification();
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
    LocationHelper.getCurrentLocation().then((value) {
      Dio dio = Dio();
      dio.post(
          "http://173.249.51.4/ctservices/location?driverId=1&latitude=${value.latitude}&longitude=${value.longitude}")
          .then((value) {
        debugPrint("AhmedTracing: sendLocation ${value.statusCode}");
      }).catchError((e) {
        debugPrint("AhmedTracing: sendLocation ${e.toString()}");
      });
    });
  }
}


