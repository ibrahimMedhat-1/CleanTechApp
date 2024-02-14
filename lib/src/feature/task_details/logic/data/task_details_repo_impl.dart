import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

class TaskDetailsRepoImpl extends TaskDetailsRepo {
  final ApiService apiService;

  TaskDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failures, GlobalModel>> changeMissionState(
      ChangeStateParams params) async {
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

  @override
  Future<Either<Failures, GlobalModel>> sendStreamPosition(
      StreamPositionParams params) async {
    try {
      final response = await apiService.postData(
          url: EndPoint.sendStreamPosition ,query: params.toMap(),data: {} );

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
