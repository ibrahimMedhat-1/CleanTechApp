import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:dartz/dartz.dart';

abstract class TaskDetailsRepo {
  Future<Either<Failures,GlobalModel>> changeMissionState(ChangeStateParams params);
}