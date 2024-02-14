import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo{
  Future<Either<Failures,ProfileModel>> getDriverProfile(int driverId);
}