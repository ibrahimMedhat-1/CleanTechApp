part of 'home_devastation_cubit.dart';

@immutable
abstract class HomeDevastationState {}

class HomeDevastationInitial extends HomeDevastationState {}

class GetDevastationMissionLoading extends HomeDevastationState {}
class GetDevastationMissionSuccess extends HomeDevastationState {}
class GetDevastationMissionFailure extends HomeDevastationState {}
