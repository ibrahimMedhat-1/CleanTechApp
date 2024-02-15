import 'package:ct_clean/src/core/config/routes/app_imports.dart';

class SalaryDetailsParams {
  final int month;
  final int year;

  SalaryDetailsParams({
    this.month = 0,
    this.year = 0,
  });

  SalaryDetailsParams copyWith({
    int? month,
    int? year,
  }) {
    return SalaryDetailsParams(
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'driverId': UserLocal.driverId,
      'month': month,
      'year': year,
    };
  }
}
