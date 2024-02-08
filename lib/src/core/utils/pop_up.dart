import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:fluttertoast/fluttertoast.dart';

flutterToast({required String msg, Color? color}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: color ?? AppColors.primary,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

flutterSnackBar({required BuildContext context, required String msg}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).primaryColorDark),
  );
}

OverlayEntry _createToastOverlayEntry(String message) {
  return OverlayEntry(
    builder: (context) => Positioned(
      // top: 0.0,
      bottom: 60.h,
      left: 0.0,
      right: 0.0,
      child: Container(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    ),
  );
}

Future<bool> onWillPop({DateTime? currentBackPressTime}) {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime ?? DateTime.now()) >
          const Duration(seconds: 2)) {
    currentBackPressTime = now;
     return Future.value(false);
  }
  return Future.value(true);
}
