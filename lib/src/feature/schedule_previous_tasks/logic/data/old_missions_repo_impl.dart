import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

class OldMissionRepoImpl extends OldMissionRepo {
  final ApiService apiService;

  OldMissionRepoImpl(this.apiService);

  @override
  Future<Either<Failures, OldMissionModel>> getOldMission(
      OldMissionParams params) async {
    try {
      final response = await apiService.getData(
          url: EndPoint.oldMissions, query: params.toMap());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = OldMissionModel.fromJson(response.data);
        return Right(data);
      } else {
        return Left(ServerFailure("Server Failure"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
