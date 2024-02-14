import 'package:ct_clean/src/core/config/routes/app_imports.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit(this.repo) : super(TaskDetailsInitial());
  TaskDetailsRepo repo;
  int currentStepIndex = 0;

  void onChangeSteps(ChangeStateParams params) {
    currentStepIndex++;
    changeMissionState(params);
    emit(ChangeStepsIndexState());
  }

  void changeMissionState(ChangeStateParams params) async {
    emit(ChangeMissionStateLoading());
    final result = await repo.changeMissionState(params);
    result.fold((l) => emit(ChangeMissionStateFailure(l)),
        (r) => emit(ChangeMissionStateSuccess()));
  }




}
