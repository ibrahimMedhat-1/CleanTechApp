import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_details_devastation_state.dart';

class TaskDetailsDevastationCubit extends Cubit<TaskDetailsDevastationState> {
  TaskDetailsDevastationCubit() : super(TaskDetailsDevastationInitial());
}
