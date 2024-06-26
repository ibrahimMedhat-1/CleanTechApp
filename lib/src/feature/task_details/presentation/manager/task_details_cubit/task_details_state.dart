part of 'task_details_cubit.dart';

@immutable
abstract class TaskDetailsState {}

class TaskDetailsInitial extends TaskDetailsState {}

class GetImage extends TaskDetailsState {}

class ChangeStepsIndexState extends TaskDetailsState {}

class ChangeMissionStateLoading extends TaskDetailsState {}

class ChangeMissionStateFailure extends TaskDetailsState {
  final Failures failures;

  ChangeMissionStateFailure(this.failures);
}

class ChangeMissionStateSuccess extends TaskDetailsState {
  final ChangeMissionStateModel? changeMissionStateModel;

  ChangeMissionStateSuccess({this.changeMissionStateModel});
}

class SkipStateLoading extends TaskDetailsState {}

class SkipStateSuccess extends TaskDetailsState {}

class SkipStateFailure extends TaskDetailsState {
  final String msg;

  SkipStateFailure(this.msg);
}

class GetMissionDetailsLoading extends TaskDetailsState {}

class GetMissionDetailsSuccess extends TaskDetailsState {
  final MissionDetailsModel missionDetailsModel;

  GetMissionDetailsSuccess({required this.missionDetailsModel});
}

class GetMissionDetailsFailure extends TaskDetailsState {}

class GetStreamLocationState extends TaskDetailsState {}
