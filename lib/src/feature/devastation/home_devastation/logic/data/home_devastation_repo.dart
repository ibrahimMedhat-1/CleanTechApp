import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

abstract class HomeDevastationRepo {
  Future<Either<Failures, List<MissionDevastationModel>>> getDamarMission();
}
