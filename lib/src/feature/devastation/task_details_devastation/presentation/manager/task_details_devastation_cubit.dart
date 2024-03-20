import 'package:ct_clean/main.dart';
import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/devastation/task_details_devastation/logic/model/check_container_model.dart';
import 'package:meta/meta.dart';

part 'task_details_devastation_state.dart';

class TaskDetailsDevastationCubit extends Cubit<TaskDetailsDevastationState> {
  TaskDetailsDevastationCubit(this.repo)
      : super(TaskDetailsDevastationInitial());
  TaskDetailsDevastationRepo repo;


  MissionDevastationModel? detailsMissionModel;

  void getMissionDevastationDetails(int missionID) async {
    emit(GetTaskDevastationDetailsLoading());
    final result = await repo.getMissionDetails(missionID);
    result.fold((l) {
      print(l.errMessage);
      emit(GetTaskDevastationDetailsFailure());
    }, (r) {
      detailsMissionModel = r;
      params = params.copyWith(missionId: r.id);
      emit(GetTaskDevastationDetailsSuccess(r));
    });
  }

  ChangeDevastationMissionParams params = ChangeDevastationMissionParams();
  ChangeMissionStateModel? changeMissionDevastationStateModel;

  void changeMissionState() async {
    emit(ChangeDevastationStateLoading());
    getterStreamPosition.onData((data) {
      params = params.copyWith(
        lat: data.latitude,
        lng: data.longitude,
      );
    });
    final result = await repo.changeMissionState(params);
    result.fold((l) {
      emit(ChangeDevastationStateFailure());
    }, (r) {
      changeMissionDevastationStateModel = r;
      emit(ChangeDevastationStateSuccess(r));
    });
  }

  CheckContainerModel? checkContainerModel;

  void checkContainer(String serial) async {
    emit(CheckContainerLoading());
    final result = await repo.checkContainer(serial);
    result.fold((l) {
      emit(CheckContainerFailure());
    }, (r) {
      checkContainerModel = r;
      emit(CheckContainerSuccess());
    });
  }

  // onChanges

  void getStreamLocation() {
    LocationHelper.getStreamLocation().listen((event) {
      params = params.copyWith(lat: event.latitude, lng: event.longitude);
    });
  }

  void serialNumberOnChange(String val) {
    params = params.copyWith(serial: val);
    checkContainer(val);
  }

  void amountOnChange(String? val) {
    params = params.copyWith(amount: double.tryParse(val ?? ''));
  }

  void commentOnChange(String? val) {
    params = params.copyWith(comment: val);
  }
}
