import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

class TimerBackgroundServiceToSend {
  static Timer timerTOSendLocation(ServiceInstance service) {
    return Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          debugPrint("AhmedTracing: Foreground Mode");
          service.setForegroundNotificationInfo(
            title: "App in foreground...",
            content: "Update ${DateTime.now()}",
          );
          // Make Anything you want
        } else {
          debugPrint("AhmedTracing: Background Mode");
          service.setForegroundNotificationInfo(
            title: "App in background...",
            content: "Update ${DateTime.now()}",
          );
          // Make Anything you want
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
}
