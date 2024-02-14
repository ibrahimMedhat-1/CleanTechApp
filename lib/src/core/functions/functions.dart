
import 'dart:io';

import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:url_launcher/url_launcher.dart';

Future<DateTime?> customShowDateTime(
  BuildContext context, {
  DateTime? firstDate,
  DateTime? lastDate,
}) =>
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:
          firstDate ?? DateTime.now().subtract(const Duration(days: 365)),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
    );

class AppFunctions {
  // void showSuccess(BuildContext context, {VoidCallback? onPress}) =>
  //     showAdaptiveDialog(
  //       context: context,
  //       builder: (context) {
  //         return WillPopScope(
  //           onWillPop: () async {
  //             return false;
  //           },
  //           child: Padding(
  //             padding: EdgeInsetsDirectional.all(20.w),
  //             child: GestureDetector(
  //                 onTap: onPress ?? () => CustomNavigator.instance.pop(),
  //                 child: Assets.svgs.confirmationImage.svg()),
  //           ),
  //         );
  //       },
  //     );

  // String getTimeString(TimeOfDay timeOfDay) {
  //   String hour = timeOfDay.hour.toString().padLeft(2, '0');
  //   String minute = timeOfDay.minute.toString().padLeft(2, '0');
  //   return '$hour:$minute';
  // }
  //
  // String removeYearFromCarModel(String carModel) {
  //   // Define a regular expression pattern to match the year at the end of the string
  //   RegExp yearPattern = RegExp(r'\s\d{4}$');
  //
  //   // Replace the matched year with an empty string
  //   String modelNameWithoutYear = carModel.replaceAll(yearPattern, '');
  //
  //   return modelNameWithoutYear.trim(); // Trim any leading or trailing spaces
  // }

  // String splitImageProfile(String image) {
  //   List<String> parts = image.split("/uploads/");
  //   if (parts.length == 2) {
  //     String filename = parts[1];
  //     return filename;
  //   } else {
  //     return image;
  //   }
  // }

  void callUsWithWhatApp(String whatsApp) async {
    final Uri whatsAppNumber = Uri.parse("https://wa.me/$whatsApp");
    if (await canLaunchUrl(whatsAppNumber)) {
      launchUrl(whatsAppNumber);
    }
  }

  void callUsWithPhone(String phone) async {
    final uri = Uri.parse("tel:$phone");
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }

  Future<void> openMap({required double lat,required double lng}) async {
    String url = '';
    String urlAppleMaps = '';
    if (Platform.isAndroid) {
      url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    } else {
      urlAppleMaps = 'https://maps.apple.com/?q=$lat,$lng';
      url = 'comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else if (await canLaunchUrl(Uri.parse(urlAppleMaps))) {
        await launchUrl(Uri.parse(urlAppleMaps));
      } else {
        throw 'Could not launch $url';
      }
    }
  }


//   void goToMail() async {
//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: 'rent@alghazal.sa',
//     );
//     if (await canLaunchUrl(emailLaunchUri)) {
//       launchUrl(emailLaunchUri);
//     }
//   }
}
