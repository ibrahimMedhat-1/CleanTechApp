part of 'salary_cubit.dart';

@immutable
abstract class SalaryState {}

class SalaryInitial extends SalaryState {}

class SalaryLoading extends SalaryState {}

class SalarySuccess extends SalaryState {}

class SalaryFailure extends SalaryState {
  final String message;

  SalaryFailure(this.message);
}
