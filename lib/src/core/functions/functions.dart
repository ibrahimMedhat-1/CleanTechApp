
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

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

//   void callUsWithWhatApp() async {
//     final Uri whatsAppNumber = Uri.parse("https://wa.me/+966550383555");
//     if (await canLaunchUrl(whatsAppNumber)) {
//       launchUrl(whatsAppNumber);
//     }
//   }
//
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
