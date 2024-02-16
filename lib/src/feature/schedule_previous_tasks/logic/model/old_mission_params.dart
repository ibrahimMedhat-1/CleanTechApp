import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class OldMissionParams {
  final int month;
  final int year;
  final int day;

  OldMissionParams({
    this.month = 0,
    this.year = 0,
    this.day = 1,
  });

  OldMissionParams copyWith({
    int? month,
    int? year,
    int? day,
  }) {
    return OldMissionParams(
      month: month ?? this.month,
      year: year ?? this.year,
      day: day ?? this.day,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'driverId': UserLocal.driverId,
      'month': month,
      'year': year,
      'day': day,
    };
  }
}
