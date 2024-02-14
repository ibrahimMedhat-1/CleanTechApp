part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class GetProfileSuccess extends ProfileState {}
class GetProfileLoading extends ProfileState {}
class GetProfileFailure extends ProfileState {}
