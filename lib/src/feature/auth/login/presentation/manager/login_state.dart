part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccess extends LoginState {
  final LoginModel loginModel;
  LoginSuccess({required this.loginModel});
}
class LoginLoading extends LoginState {}
class LoginFailure extends LoginState {
  final String msg;

  LoginFailure({required this.msg});
}

class ShowLoginPassword extends LoginState {}
class ChangeLangState extends LoginState {}
