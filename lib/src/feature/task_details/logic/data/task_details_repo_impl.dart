import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/task_details/logic/data/task_details_repo.dart';
import 'package:dartz/dartz.dart';

class TaskDetailsRepoImpl extends TaskDetailsRepo {
  final ApiService apiService;

  TaskDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failures, GlobalModel>> changeMissionState(
      ChangeStateParams params) async {
print(" missionId ${params.missionId}");
print(" comment ${params.comment}");
print(" latitude ${params.latitude}");
print(" longitude ${params.longitude}");
    try {
      final response = await apiService.postData(
          url: EndPoint.changeStatus, data: {}, query: params.toMap());
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
}
