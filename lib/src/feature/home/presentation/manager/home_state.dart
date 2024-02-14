part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeIndexState extends HomeState {}

class GetMissionsListLoading extends HomeState {}

class GetMissionsListSuccess extends HomeState {}

class GetMissionsListFailure extends HomeState {
  final String message;

  GetMissionsListFailure(this.message);
}
