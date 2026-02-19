import 'dart:developer';

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
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        if (user.emailVerified) {
          emit(LoginSuccess());
          customReplaceNavigation(AppRouter.kHomeNavBarView);
        } else {
          emit(LoginError(
            errMessage: "Please verify your email",
          ));
          showFlutterToast(message: "Please verify your email");
        }
      } else {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (userCredential.user!.emailVerified) {
          emit(LoginSuccess());
          customReplaceNavigation(AppRouter.kHomeNavBarView);
        } else {
          await verifyEmail();
          emit(LoginError(
            errMessage: "Please verify your email",
          ));
          showFlutterToast(message: "Please verify your email");
        }
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          emit(LoginError(
            errMessage: AppStrings.invalid_email_or_password,
          ));
          showFlutterToast(message: AppStrings.invalid_email_or_password);
          break;

        case 'user-disabled':
          emit(LoginError(
            errMessage: "This account has been disabled",
          ));
          break;

        case 'too-many-requests':
          emit(LoginError(
            errMessage: "Too many attempts. Try again later",
          ));
          break;

        default:
          emit(LoginError(
            errMessage: e.message ?? "Something went wrong",
          ));
      }
    } catch (e) {
      showFlutterToast(message: e.toString());
      emit(LoginError(errMessage: e.toString()));
      log(e.toString());
    }
  }

  Future<void> verifyEmail() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
