import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class EndPoint {
  // genral EndPoint
  // auth End Point
  static const String login = "/login";
  static const String profile = "/profile";
  static const String contacts = "/contacts";
  static const String missions = "/missions";
  static const String changeStatus = "/changestatus";
  static const String skip = "/skip";
  static const String sendStreamPosition = "/location";
  static const String salary = "/salary";
  static const String oldMissions = "/oldmissions";
  static const String missionsDetails = "/missionsdetails";

  static String sendLocationFullLink({
    required LatLng position,
    required int driverId,
    required int missionId,
  }) =>
      "http://173.249.51.4/ctservices/location?driverId=$driverId&latitude=${position.latitude}&longitude=${position.longitude}&missionId=$missionId";
}
