import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

class HomeDevastationRepoImpl extends HomeDevastationRepo {
  HomeDevastationRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failures, List<MissionDevastationModel>>>
      getDamarMission() async {
    List<MissionDevastationModel> list = [];

    try {
      final response = await apiService.getData(url: EndPoint.getDamarMission);
      if (response.statusCode == 200 || response.statusCode == 201) {
        response.data.forEach((e) {
          list.add(MissionDevastationModel.fromJson(e));
        });
        return Right(list);
      } else {
        return left(ServerFailure("Error"));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
