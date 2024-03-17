import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failures, LoginModel>> login(LoginParams params);
  Future<Either<Failures, List<CarModel>>> getCars(String plate);
}
