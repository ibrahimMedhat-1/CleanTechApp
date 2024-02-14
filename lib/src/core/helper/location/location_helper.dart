import 'package:geolocator/geolocator.dart';

class LocationHelper {
  void isLocationEnabled() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.openLocationSettings();
    }
  }

  void getPermissionLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  static Future<Position?> getMyCurrentLocationWithWhenComplete() async {
    return Geolocator.getLastKnownPosition().whenComplete(() {});
  }

  static Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }
  static Stream<Position> getStreamLocation() {
    return Geolocator.getPositionStream();
  }
}
