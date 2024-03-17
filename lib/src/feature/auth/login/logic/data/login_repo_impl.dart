import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

class LoginRepoImpl extends LoginRepo {
  LoginRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failures, LoginModel>> login(LoginParams params) async {
    try {
      final response = await apiService.postData(
        url: EndPoint.login,
        data: {},
        query: params.toMap(),
      );
      final user = LoginModel.fromJson(response.data);
      if (user.status == true) {
        return Right(user);
      } else {
        return left(ServerFailure(user.msg.toString()));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<CarModel>>> getCars(String plate) async {
    List<CarModel> list = [];
    try {
      final response = await apiService.getData(url: EndPoint.getCars(plate));

      if (response.statusCode == 200 || response.statusCode == 201) {
        response.data.forEach((e) {
          list.add(CarModel.fromJson(e));
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
