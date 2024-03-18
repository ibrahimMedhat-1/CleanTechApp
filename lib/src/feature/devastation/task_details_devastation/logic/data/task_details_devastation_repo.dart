import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

abstract class TaskDetailsDevastationRepo{
  Future<Either<Failures,MissionDevastationModel>> getMissionDetails(int missionId);
  Future<Either<Failures,GlobalModel>> changeMissionState();

}