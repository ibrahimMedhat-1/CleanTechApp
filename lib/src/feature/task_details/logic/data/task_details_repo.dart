import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

abstract class TaskDetailsRepo {
  Future<Either<Failures, ChangeMissionStateModel>> changeMissionState(
      ChangeStateParams params);

  Future<Either<Failures, MissionDetailsModel>> getMissionDetails(int missionId);

  Future<Either<Failures, GlobalModel>> sendStreamPosition(
      StreamPositionParams params);
}
