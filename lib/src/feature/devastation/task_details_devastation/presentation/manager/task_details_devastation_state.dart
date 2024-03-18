part of 'task_details_devastation_cubit.dart';

@immutable
abstract class TaskDetailsDevastationState {}

class TaskDetailsDevastationInitial extends TaskDetailsDevastationState {}
class GetTaskDevastationDetailsSuccess extends TaskDetailsDevastationState {}
class GetTaskDevastationDetailsLoading extends TaskDetailsDevastationState {}
class GetTaskDevastationDetailsFailure extends TaskDetailsDevastationState {}
