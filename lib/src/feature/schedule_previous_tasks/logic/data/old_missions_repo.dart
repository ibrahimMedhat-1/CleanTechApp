import 'package:ct_clean/src/core/config/routes/app_imports.dart';

import 'package:dartz/dartz.dart';

abstract class OldMissionRepo{
  Future<Either<Failures,OldMissionModel>> getOldMission(OldMissionParams params);
}