import 'package:ct_clean/src/core/config/routes/app_imports.dart';
part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit(this.repo) : super(TaskDetailsInitial());
  TaskDetailsRepo repo;
  int currentStepIndex = 0;

  void onChangeSteps() {
    currentStepIndex++;
    changeMissionState();
    emit(ChangeStepsIndexState());
  }

  ChangeStateParams changeStateParams = ChangeStateParams(missionId: 1);

  void changeMissionState() async {
    emit(ChangeMissionStateLoading());
    final result = await repo.changeMissionState(changeStateParams);
    result.fold((l) => emit(ChangeMissionStateFailure(l)),
        (r) => emit(ChangeMissionStateSuccess()));
  }
}
