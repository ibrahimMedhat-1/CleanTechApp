import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

abstract class SalaryDetailsRepo {
  Future<Either<Failures,SalaryDetailsModel>> getSalaryDetails(SalaryDetailsParams params);
}