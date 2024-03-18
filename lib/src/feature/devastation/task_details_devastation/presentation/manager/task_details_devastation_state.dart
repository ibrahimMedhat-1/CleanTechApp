part of 'task_details_devastation_cubit.dart';

@immutable
abstract class TaskDetailsDevastationState {}

class TaskDetailsDevastationInitial extends TaskDetailsDevastationState {}
class GetTaskDevastationDetailsSuccess extends TaskDetailsDevastationState {}
class GetTaskDevastationDetailsLoading extends TaskDetailsDevastationState {}
class GetTaskDevastationDetailsFailure extends TaskDetailsDevastationState {}

class ChangeDevastationStateFailure extends TaskDetailsDevastationState {}
class ChangeDevastationStateSuccess extends TaskDetailsDevastationState {
  ChangeDevastationStateSuccess(this.r);
 final ChangeMissionStateModel r;
}
class ChangeDevastationStateLoading extends TaskDetailsDevastationState {}
class CheckContainerLoading extends TaskDetailsDevastationState {}
class CheckContainerSuccess extends TaskDetailsDevastationState {}
class CheckContainerFailure extends TaskDetailsDevastationState {}


