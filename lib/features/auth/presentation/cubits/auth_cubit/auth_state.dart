part of 'auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class UserTogleTermsAndConditions extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpError extends AuthState {
  final String errMessage;

  SignUpError({required this.errMessage});
}
