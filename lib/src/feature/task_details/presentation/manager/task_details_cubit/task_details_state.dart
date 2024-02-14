part of 'task_details_cubit.dart';

@immutable
abstract class TaskDetailsState {}

class TaskDetailsInitial extends TaskDetailsState {}

class ChangeStepsIndexState extends TaskDetailsState {}

class ChangeMissionStateLoading extends TaskDetailsState {}

class ChangeMissionStateFailure extends TaskDetailsState {
  final Failures failures;

  ChangeMissionStateFailure(this.failures);
}

class ChangeMissionStateSuccess extends TaskDetailsState {}
