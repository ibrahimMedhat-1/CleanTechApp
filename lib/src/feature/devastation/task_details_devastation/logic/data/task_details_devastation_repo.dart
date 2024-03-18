import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/devastation/task_details_devastation/logic/model/check_container_model.dart';
import 'package:dartz/dartz.dart';

abstract class TaskDetailsDevastationRepo{
  Future<Either<Failures,MissionDevastationModel>> getMissionDetails(int missionId);
  Future<Either<Failures,ChangeMissionStateModel>> changeMissionState(ChangeDevastationMissionParams params);
  Future<Either<Failures,CheckContainerModel>> checkContainer(String serial);

}