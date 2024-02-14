part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileSuccess extends ProfileState {}
class GetProfileLoading extends ProfileState {}
class GetProfileFailure extends ProfileState {}
class GetContactsSuccess extends ProfileState {}
class GetContactsLoading extends ProfileState {}
class GetContactsFailure extends ProfileState {}
