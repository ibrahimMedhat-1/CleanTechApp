import 'package:ct_clean/src/core/config/routes/app_imports.dart';
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
      emit(GetTaskDevastationDetailsSuccess());
    });
  }
}
