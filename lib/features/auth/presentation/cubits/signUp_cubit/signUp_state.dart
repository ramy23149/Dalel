part of 'signUp_cubit.dart';

class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class UserTogleTermsAndConditions extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpError extends SignUpState {
  final String errMessage;

  SignUpError({required this.errMessage});
}
