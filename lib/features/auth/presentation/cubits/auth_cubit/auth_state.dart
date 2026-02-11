part of 'auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class UserTogleTermsAndConditions extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpError extends AuthState {
  final String errMessage;

  SignUpError({required this.errMessage});
}
