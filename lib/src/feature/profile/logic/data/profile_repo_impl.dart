import 'package:ct_clean/src/core/config/routes/app_imports.dart';
 import 'package:dartz/dartz.dart';

class ProfileRepoImpl extends ProfileRepo {
  ProfileRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failures, ProfileModel>> getDriverProfile(int driverId) async {
    try {
      final response = await apiService.getData(url: EndPoint.profile,query: {'driverId': driverId});
      final user = ProfileModel.fromJson(response.data);
      if (user.status == true) {
        return Right(user);
      } else {
        return Left(ServerFailure(user.msg.toString()));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
