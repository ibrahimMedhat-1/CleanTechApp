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
  ChangeStateParams changeStateParams = ChangeStateParams();

  TextEditingController noteController = TextEditingController();

  // void noteOnChange(String value) {
  //   changeStateParams = changeStateParams.copyWith(comment: value);
  // }
  ChangeMissionStateModel? changeMissionStateModel;

  void getLocation(){
    LocationHelper.getCurrentLocation().then((value) {
      changeStateParams = changeStateParams.copyWith(
        latitude: value.latitude,
        longitude: value.longitude,
      );
    });
  }
  void changeMissionState({required int missionId}) async {
    print(" the mission id is $missionId");
    // LocationHelper.getCurrentLocation().then((value) {
    //   changeStateParams = changeStateParams.copyWith(
    //     missionId: missionId,
    //     latitude: value.latitude,
    //     longitude: value.longitude,
    //     comment: noteController.text,
    //   );
    // });
    emit(ChangeMissionStateLoading());
    changeStateParams = changeStateParams.copyWith(
      missionId: missionId,
      comment: noteController.text,
    );
    final result = await repo.changeMissionState(changeStateParams);
    result.fold(
      (l) => emit(ChangeMissionStateFailure(l)),
      (r) {
        changeMissionStateModel = r;
        // print("the changeMissionStateModel is ${changeMissionStateModel?.status}");
        emit(ChangeMissionStateSuccess(changeMissionStateModel: r));
        noteController.clear();
        // r.next != 0 ? getMissionDetails(r.next ?? 0) : null;
      },
    );
  }

  MissionDetailsModel? missionDetailsModel;

  void getMissionDetails(int missionId) async {
    print(missionId);
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
