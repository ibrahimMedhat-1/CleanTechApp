import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/helper/error/failures.dart';
import 'package:ct_clean/src/core/model/global_model.dart';
import 'package:ct_clean/src/feature/devastation/home_devastation/logic/model/mission_devastation_model.dart';
import 'package:ct_clean/src/feature/devastation/task_details_devastation/logic/data/task_details_devastation_repo.dart';
import 'package:dartz/dartz.dart';

class TaskDetailsDevastationRepoImpl extends TaskDetailsDevastationRepo {
  TaskDetailsDevastationRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failures, MissionDevastationModel>> getMissionDetails(
      int missionId) async {
    try {
      final response = await apiService.getData(
          url: EndPoint.damarMissionsDetails, query: {"missionId": missionId});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final user = MissionDevastationModel.fromJson(response.data);
        return Right(user);
      } else {
        return left(ServerFailure("Error"));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ChangeMissionStateModel>> changeMissionState(
      ChangeDevastationMissionParams params) async {
    print(params.lat);
    print(params.lng);
    try {
      final response = await apiService
          .postData(url: EndPoint.damarstatus, query: params.toMap(), data: {});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final user = ChangeMissionStateModel.fromJson(response.data);
        return Right(user);
      } else {
        final user = ChangeMissionStateModel.fromJson(response.data);

        return left(ServerFailure(user.msg ?? 'Error'));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
