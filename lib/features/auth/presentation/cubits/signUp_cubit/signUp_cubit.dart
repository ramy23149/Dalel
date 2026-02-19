import 'dart:developer';

import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/functions/show_flutter_toast.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/utils/app_constants.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  bool isConfirmTermsAndConditions = false;
  void _init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    lastNameController = TextEditingController();
    firstNameController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  Future<void> _createUserWithEmailAndPassword() async {
    emit(SignUpLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
    await  createUserProfile();
    await _verifyEmail();
      log("user ${credential.user} created successfully");
      emit(SignUpSuccess(message: AppStrings.check_your_email));
      showFlutterToast(message: AppStrings.check_your_email);
      customReplaceNavigation(AppRouter.kLogInView);
    } on FirebaseAuthException catch (e) {
      _handleFirebaseError(e);
    }
  }

  void _handleFirebaseError(FirebaseAuthException e) {
    if (e.code == 'email-already-in-use') {
      log('The account already exists for that email.');
      emit(SignUpError(
          errMessage: AppStrings.The_account_already_exists_for_that_email));
      showFlutterToast(
          message: AppStrings.The_account_already_exists_for_that_email);
    } else if (e.code == 'weak-password') {
      emit(SignUpError(
          errMessage: AppStrings.Password_should_be_at_least_6_characters));
      showFlutterToast(
          message: AppStrings.Password_should_be_at_least_6_characters);
    } else if (e.code == 'invalid-email') {
      emit(SignUpError(errMessage: AppStrings.Invalid_email));
      showFlutterToast(message: AppStrings.Invalid_email);
    } else {
      emit(SignUpError(errMessage: e.code));
      showFlutterToast(message: e.code);
    }
  }

  Future<void> createUserProfile() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection(kUsersCollection).doc(userId).set({
      'email': emailController.text,
      'firstName': firstNameController.text,
      'lastName': lastNameController.text
    });
  }

  void onChangeTermsAndConditionsConfirmation() {
    isConfirmTermsAndConditions = !isConfirmTermsAndConditions;
    emit(UserTogleTermsAndConditions());
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      if (isConfirmTermsAndConditions) {
        _createUserWithEmailAndPassword();
      } else {
        showFlutterToast(
            message: AppStrings.Please_accept_terms_and_conditions);
      }
    }
  }

  Future<void> _verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
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
