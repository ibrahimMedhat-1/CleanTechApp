// import 'package:ct_clean/src/core/config/routes/app_imports.dart';
// import 'package:dartz/dartz.dart';
//
// class DoubleBackToCloseWidget extends StatefulWidget {
//   DoubleBackToCloseWidget({super.key, required this.child});
//
//   final Widget child;
//   static const exitTimeInMillis = 2000;
//
//   @override
//   State<DoubleBackToCloseWidget> createState() => _DoubleBackToCloseWidgetState();
//
//
// class _DoubleBackToCloseWidgetState extends State<DoubleBackToCloseWidget> {
//   int? _lastTimeBackButtonWasTapped;
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       // canPop: true,
//       // onPopInvoked: (didPop) => _handleWillPop(),
//       onWillPop: onWillPop,
//       child: widget.child,
//     );
//   }
//
//   DateTime? currentBackPressTime;
//
//   bool canPopNow = false;
//
//   int requiredSeconds = 2;
//
//   void onPopInvoked(bool didPop) {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime) > Duration(seconds: requiredSeconds)) {
//       currentBackPressTime = now;
//       Fluttertoast.showToast(msg: exit_warning);
//       Future.delayed(
//         Duration(seconds: requiredSeconds),
//             () {
//           // Disable pop invoke and close the toast after 2s timeout
//           setState(() {
//             canPopNow = false;
//           });
//           Fluttertoast.cancel();
//         },
//       );
//       // Ok, let user exit app on the next back press
//       setState(() {
//         canPopNow = true;
//       });
//     }
//
//   // DateTime? currentBackPressTime;
//   // Future<bool> onWillPop() {
//   //   DateTime now = DateTime.now();
//   //   if (currentBackPressTime == null ||
//   //       now.difference(currentBackPressTime ?? DateTime.now()) > Duration(seconds: 2)) {
//   //     currentBackPressTime = now;
//   //     flutterToast(msg: 'Press BACK again to exit!');
//   //     return Future.value(false);
//   //   }
//   //   return Future.value(true);
//   // }
//   // Future<bool> _handleWillPop() async {
//   //   final currentTime = DateTime.now().millisecondsSinceEpoch;
//   //   if (_lastTimeBackButtonWasTapped != null &&
//   //       (currentTime - (_lastTimeBackButtonWasTapped ?? 0)) <
//   //           exitTimeInMillis) {
//   //     return true;
//   //   } else {
//   //     _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
//   //     flutterToast(msg: 'Press BACK again to exit!');
//   //     return false;
//   //   }
//   // }
// }

import 'package:ct_clean/src/core/utils/pop_up.dart';
import 'package:flutter/material.dart';

class DoubleBackToCloseWidget extends StatefulWidget {
  const DoubleBackToCloseWidget({super.key, required this.child});

  final Widget child;

  @override
  State<DoubleBackToCloseWidget> createState() =>
      _DoubleBackToCloseWidgetState();
}

class _DoubleBackToCloseWidgetState extends State<DoubleBackToCloseWidget> {
  DateTime? currentBackPressTime;
  bool canPopNow = false;
  int requiredSeconds = 2;

  void onPopInvoked(bool didPop) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime ?? DateTime.now()) >
            Duration(seconds: requiredSeconds)) {
      currentBackPressTime = now;
      flutterToast(msg: 'Press BACK again to exit!');
      Future.delayed(
        Duration(seconds: requiredSeconds),
        () {
          // Disable pop invoke and close the toast after 2s timeout
          setState(() {
            canPopNow = false;
          });
          // Fluttertoast.cancel();
        },
      );
      // Ok, let user exit app on the next back press
      setState(() {
        canPopNow = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPopNow,
      onPopInvoked: onPopInvoked,
      child: widget.child,
    );
  }
}
