import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

class TaskDetailsRepoImpl extends TaskDetailsRepo {
  final ApiService apiService;

  TaskDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failures, ChangeMissionStateModel>> changeMissionState(
      ChangeStateParams params) async {
    print("in Repo impl ${params.toMap()}");
    try {
      final response = await apiService.postData(
          url: EndPoint.changeStatus, data: {}, query: params.toMap());
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final user = ChangeMissionStateModel.fromJson(response.data);
        return Right(user);
      } else {
        return left(ServerFailure("Error in server response"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, GlobalModel>> sendStreamPosition(
      StreamPositionParams params) async {
    try {
      final response = await apiService.postData(
          url: EndPoint.sendStreamPosition, query: params.toMap(), data: {});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final user = GlobalModel.fromJson(response.data);
        return Right(user);
      } else {
        return left(ServerFailure("Error in server response"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MissionDetailsModel>> getMissionDetails(
      int missionId) async {
    try {
      final response = await apiService.getData(
        url: EndPoint.missionsDetails,
        query: {"missionId": missionId},
      );
      if (response.statusCode == 200 || response.data == 201) {
        final user = MissionDetailsModel.fromJson(response.data);
        return Right(user);
      } else {
        return left(ServerFailure("Error in getMissionDetails"));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
