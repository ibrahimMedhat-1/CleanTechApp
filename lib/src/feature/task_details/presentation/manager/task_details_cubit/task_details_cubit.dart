import 'package:ct_clean/src/core/config/routes/app_imports.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit(this.repo) : super(TaskDetailsInitial());
  TaskDetailsRepo repo;

  // int currentStepIndex = -1;

  // void onChangeSteps(ChangeStateParams params) {
  //   // currentStepIndex++;
  //
  //   changeMissionState(params);
  //   // print(currentStepIndex);
  //   emit(ChangeStepsIndexState());
  // }
  // ChangeMissionStateModel? changeMissionStateModel;
  void changeMissionState(ChangeStateParams params) async {
    emit(ChangeMissionStateLoading());
    final result = await repo.changeMissionState(params);
    result.fold(
      (l) => emit(ChangeMissionStateFailure(l)),
      (r) {
        // changeMissionStateModel = r;
        // print("the changeMissionStateModel is ${changeMissionStateModel?.status}");
        emit(ChangeMissionStateSuccess());
      },
    );
  }

  MissionDetailsModel? missionDetailsModel;

  void getMissionDetails(int missionId) async {
    emit(GetMissionDetailsLoading());
    final result = await repo.getMissionDetails(missionId);
    result.fold((l) {
      print(l.errMessage);
      emit(GetMissionDetailsFailure());
    }, (r) {
      missionDetailsModel = r;
      emit(GetMissionDetailsSuccess());
    });
  }
}
