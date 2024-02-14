import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/home/logic/data/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failures, List<MissionModel>>> getMissionsList() async {
    List<MissionModel>? listMissions;

    try {
      final response = await apiService.getData(
          url: EndPoint.missions, query: {"driverId": UserLocal.driverId});
      // print("A");
      if (response.statusCode == 200 || response.statusCode == 201) {
        // listMissions = [];
        // print("B");

        // response.data.forEach((e) {
        //   listMissions?.add(MissionModel.fromJson(e));
        // });
        // print("C");

        listMissions = (response.data as List)
            .map((e) => MissionModel.fromJson(e))
            .toList();

        return Right(listMissions);
      } else {
        return Left(ServerFailure("Server Failure in getMissionsList()"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
