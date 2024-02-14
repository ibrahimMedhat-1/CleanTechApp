part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}
// askUserToEnableLocation
class EnableLocationSuccess extends MapState {}
class EnableLocationLoading extends MapState {}
class EnableLocationError extends MapState {}
//getCurrentLocation
class GetCurrentLocationSuccess extends MapState {}
class GetCurrentLocationLoading extends MapState {}
class GetCurrentLocationError extends MapState {}
// add marker
class AddMarkerSuccessInBranches extends MapState {}
// Stream Location
class GetStreamLocationLoading extends MapState {}
class GetStreamLocationSuccess extends MapState {}
class GetStreamLocationError extends MapState {}
// Send Stream Location
class SendStreamLocationLoading extends MapState {}
class SendStreamLocationSuccess extends MapState {}
class SendStreamLocationError extends MapState {}