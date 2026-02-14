import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/functions/show_flutter_toast.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    _init();
  }

  static LoginCubit get(context) => BlocProvider.of(context);

  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  void _init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void validateFormAndLogin() {
    if (formKey.currentState!.validate()) {
      loginWithEmailAndPassword();
    }
  }

  Future<void> loginWithEmailAndPassword() async {
    emit(LoginLoading());
    try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginSuccess());
      customGoNavigation(AppRouter.kHomeView);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showFlutterToast(message: AppStrings.user_not_found);
        emit(LoginError(errMessage: AppStrings.user_not_found));
      } else if (e.code == 'wrong-password') {
        showFlutterToast(message: AppStrings.wrong_password);
        emit(LoginError(errMessage: AppStrings.wrong_password));
      }
    } catch (e) {
      showFlutterToast(message: e.toString());
      emit(LoginError(errMessage: e.toString()));
    }
  }
}
