import 'package:dalel_app/features/auth/presentation/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());
  final LoginRepo loginRepo;
  static LoginCubit get(context) => BlocProvider.of(context);

  bool isDataValid({required GlobalKey<FormState> formKey}) =>
      loginRepo.validateFormData(formKey: formKey);

  Future<void> login({
    required GlobalKey<FormState> formKey,
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    if (isDataValid(formKey: formKey)) {
      final result = await loginRepo.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      result.fold(
        (err) {
          emit(LoginError(errMessage: err.message));
        },
        (_) {
          emit(LoginSuccess());
        },
      );
    }
  }
}
