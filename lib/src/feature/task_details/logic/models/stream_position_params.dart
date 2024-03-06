import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class StreamPositionParams {
  final double lat;
  final double lng;
  final int missionId;

  StreamPositionParams({this.lat = 0.0, this.lng = 0.0, this.missionId = 0});

  StreamPositionParams copyWith({
    double? lat,
    double? lng,
    int? missionId,
  }) {
    return StreamPositionParams(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      missionId: missionId ?? this.missionId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'driverId': UserLocal.driverId,
      "missionId": missionId,
      'lat': lat,
      'lng': lng,
    };
  }
}
