import 'package:ct_clean/src/core/config/routes/app_imports.dart';
part 'old_mission_state.dart';

class OldMissionCubit extends Cubit<OldMissionState> {
  OldMissionCubit(this.oldMissionRepo) : super(OldMissionInitial());
  final OldMissionRepo oldMissionRepo;
  OldMissionModel? oldMissionModel;

  void getOldMission(OldMissionParams params) async {
    emit(OldMissionLoading());
    final result = await oldMissionRepo.getOldMission(params);
    result.fold((l) => emit(OldMissionFailure(l.errMessage)), (r) {
      oldMissionModel = r;
      emit(OldMissionSuccess());
    });
  }
  void calenderOnDateChanged(DateTime value) {
    getOldMission(OldMissionParams(year: value.year, month: value.month, day: value.day));
  }
}
