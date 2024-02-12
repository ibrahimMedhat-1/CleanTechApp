import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  TaskDetailsCubit() : super(TaskDetailsInitial());
  int currentStepIndex = 0;

  void onChangeSteps() {
     currentStepIndex++;
     emit(ChangeStepsIndexState());
  }
}
