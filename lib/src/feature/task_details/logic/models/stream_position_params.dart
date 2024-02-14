import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class StreamPositionParams {
  final double lat;
  final double lng;

  StreamPositionParams({
    this.lat = 0.0,
    this.lng = 0.0,
  });

  StreamPositionParams copyWith({
    double? lat,
    double? lng,
  }) {
    return StreamPositionParams(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'driverId': UserLocal.driverId,
      'lat': lat,
      'lng': lng,
    };
  }
}
