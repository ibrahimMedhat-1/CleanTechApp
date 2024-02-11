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
