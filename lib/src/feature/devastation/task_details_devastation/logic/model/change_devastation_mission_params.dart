class ChangeDevastationMissionParams {
  final int missionId;
  final String comment;
  final double lat;
  final double lng;
  final double amount;
  final String serial;

  ChangeDevastationMissionParams({
    this.missionId = 0,
    this.comment = '',
    this.lat = 0.0,
    this.lng = 0.0,
    this.amount = 0.0,
    this.serial = '',
  });

  ChangeDevastationMissionParams copyWith({
    int? missionId,
    String? comment,
    double? lat,
    double? lng,
    double? amount,
    String? serial,
  }) {
    return ChangeDevastationMissionParams(
      missionId: missionId ?? this.missionId,
      comment: comment ?? this.comment,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      amount: amount ?? this.amount,
      serial: serial ?? this.serial,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'missionId': missionId,
      'comment': comment,
      'latitude': lat,
      'longitude': lng,
      'amount': amount,
      'serial': serial,
    };
  }


}
