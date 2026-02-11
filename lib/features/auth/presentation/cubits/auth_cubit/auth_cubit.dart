import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    _init();
  }

  static AuthCubit get(context) => BlocProvider.of(context);

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
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      log("user ${credential.user} created successfully");
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        emit(SignUpError(errMessage: "The account already exists for that email."));
      } else if (e.code == 'weak-password') {
        emit(SignUpError(errMessage: "Password should be at least 6 characters"));
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
        log("please accept terms and conditions");
      }
    }
  }
}
