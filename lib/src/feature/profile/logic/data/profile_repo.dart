import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/profile/logic/model/contact_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo{
  Future<Either<Failures,ProfileModel>> getDriverProfile(int driverId);
  Future<Either<Failures,ContactsModel>> getContacts();
}