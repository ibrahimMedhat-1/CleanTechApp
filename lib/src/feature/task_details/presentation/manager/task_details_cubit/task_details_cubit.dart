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

  TextEditingController noteController = TextEditingController();

  // void noteOnChange(String value) {
  //   changeStateParams = changeStateParams.copyWith(comment: value);
  // }
  ChangeMissionStateModel? changeMissionStateModel;

  void getLocation() {
    LocationHelper.getStreamLocation().listen((event) {
      position = event;
      print(position?.longitude);
      emit(GetStreamLocationState());
      // changeStateParams = changeStateParams.copyWith(
      //   latitude: event.latitude,
      //   longitude: event.longitude,
      // );
    });
  }

  void changeMissionState(
      {required int missionId,
      required double lat,
      required double lng}) async {
    print(" the mission id is $missionId");
    getLocation();
    emit(ChangeMissionStateLoading());
    // changeStateParams = changeStateParams.copyWith(
    //   missionId: missionId,
    //   comment: noteController.text,
    // );
    final result = await repo.changeMissionState(ChangeStateParams(
      missionId: missionId,
      comment: noteController.text,
      latitude: lat,
      longitude: lng,
    ));
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

  void skip(
      {required int missionId,
      required double lat,
      required double lng}) async {
    emit(ChangeMissionStateLoading());
    final result = await repo.skip(ChangeStateParams(
      missionId: missionId,
      comment: noteController.text,
      latitude: lat,
      longitude: lng,
    ));
    result.fold(
      (l) => emit(ChangeMissionStateFailure(l)),
      (r) {
        changeMissionStateModel = r;
        emit(ChangeMissionStateSuccess(changeMissionStateModel: r));
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
      emit(GetMissionDetailsSuccess(missionDetailsModel: r));
    });
  }
}
