part of 'login_cubit.dart';

 class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final String errMessage;
  LoginError({required this.errMessage});
}
