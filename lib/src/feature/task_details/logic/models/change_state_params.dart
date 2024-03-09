class ChangeStateParams {
  final int missionId;
  final String comment;
  final double latitude;
  final double longitude;

  ChangeStateParams({
    required this.missionId  ,
    required this.comment ,
    required  this.latitude ,
    required this.longitude ,
  });

  ChangeStateParams copyWith({
    int? missionId,
    String? comment,
    double? latitude,
    double? longitude,
  }) {
    return ChangeStateParams(
      missionId: missionId ?? this.missionId,
      comment: comment ?? this.comment,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'missionId': missionId,
      'comment': comment,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
