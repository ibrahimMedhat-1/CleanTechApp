part of 'old_mission_cubit.dart';

@immutable
abstract class OldMissionState {}

class OldMissionInitial extends OldMissionState {}

class OldMissionLoading extends OldMissionState {}

class OldMissionSuccess extends OldMissionState {
  OldMissionSuccess();
}

class OldMissionFailure extends OldMissionState {
  final String message;

  OldMissionFailure(this.message);
}
