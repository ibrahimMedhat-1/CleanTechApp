class ChangeStateParams {
  final int missionId;
  final String comment;

  ChangeStateParams({
      this.missionId = 0,
      this.comment = '',
  });

  ChangeStateParams copyWith({
    int? missionId,
    String? comment,
  }) {
    return ChangeStateParams(
      missionId: missionId ?? this.missionId,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'missionId': missionId,
      'comment': comment,
    };
  }


}
