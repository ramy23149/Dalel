import 'dart:developer';

import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/functions/show_flutter_toast.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signUp_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial()) {
    _init();
  }

  static SignUpCubit get(context) => BlocProvider.of(context);

  late final TextEditingController emailController,
      passwordController,
      lastNameController,
      firstNameController;
  late final GlobalKey<FormState> formKey;
  bool isPasswordVisible = false;
  bool isConfirmTermsAndConditions = false;
  void _init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    lastNameController = TextEditingController();
    firstNameController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  Future<void> createUserWithEmailAndPassword() async {
    emit(SignUpLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      log("user ${credential.user} created successfully");
      emit(SignUpSuccess(
        message: AppStrings.account_created_successfully
      ));     
      showFlutterToast(message: AppStrings.account_created_successfully);
      customGoNavigation(AppRouter.kHomeView);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        emit(SignUpError(errMessage: AppStrings.The_account_already_exists_for_that_email));
        showFlutterToast(message: AppStrings.The_account_already_exists_for_that_email);
      } else if (e.code == 'weak-password') {
        emit(SignUpError(errMessage: AppStrings.Password_should_be_at_least_6_characters));
        showFlutterToast(message: AppStrings.Password_should_be_at_least_6_characters);
      }
    }
  }

  void onChangeTermsAndConditionsConfirmation() {
    isConfirmTermsAndConditions = !isConfirmTermsAndConditions;
    emit(UserTogleTermsAndConditions());
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      if (isConfirmTermsAndConditions) {
        createUserWithEmailAndPassword();
      } else {
        showFlutterToast(message: AppStrings.Please_accept_terms_and_conditions);
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    return super.close();
  }
}
