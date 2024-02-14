
import 'package:ct_clean/src/core/config/routes/app_imports.dart';

extension StrExtension on String {
  bool get isNum => double.tryParse(this) != null;

  bool get isEmail =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(this);

  String toFullPhoneNumber({String countryCode = "+966"}) {
    if (startsWith("+966")) {
      return this;
    } else if (startsWith("0")) {
      return "+966${substring(1)}";
    } else {
      return "+966$this";
    }
  }

  int get daysBetween {
    DateTime fromDateTime = DateTime.tryParse(this) ?? DateTime.now();
    int dateTime =
        (((DateTime.now().difference(fromDateTime).inHours) / 24).round());
    int result = dateTime < 0 ? dateTime * -1 : dateTime;
    return result;
  }

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension StrNullableExtension on String? {
  // String formateDate() {
  //   return DateFormat('dd , MMM yyyy', LocalizationUtils?.locale)
  //       .format(DateTime.parse(this ?? DateTime.now().toString()));
  // }

  String? getPathSegmentFromUrl(int length, String desiredSegment) {
    final url = Uri.parse(this ?? '');
    final segments =
        (url.pathSegments.contains("en") || url.pathSegments.contains("ar"))
            ? url.pathSegments.sublist(1)
            : url.pathSegments;
    if (segments.length == length && segments[0] == desiredSegment) {
      return segments[length - 1];
    }
    return null;
  }

}
 extension LoadingString on String{
  String get loadingString => '███▒▒▒ 70…$this';
 }
extension GenralValidation on String {
  bool validatorEmail() =>
      RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]").hasMatch(this);

  String? generalValidate(String? value, {String value2 = 'value'}) {
    if (value == null || value.isEmpty) {
      return this;
    }
    return null;
  }
}

extension Validation on BuildContext {
  String? emailValidate(String? value) {
    bool validatorEmail() => RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
        .hasMatch(value ?? '');
    if (value == null || value.isEmpty) {
      return 'برجاء عدم ترك الحقل فارغ';
    } else if (!validatorEmail()) {
      return "Please Enter ex. xxxx@gmail.com";
    }
    return null;
  }

  String? generalValidate(String? value) {
    if (value == null || value.isEmpty) {
      return value;
    }
    return null;
  }
}


