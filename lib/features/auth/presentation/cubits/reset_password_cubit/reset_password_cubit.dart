import 'dart:developer';

import 'package:dalel_app/core/functions/show_flutter_toast.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial()){
    _init();
  }

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  void _init() {
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

late final TextEditingController emailController;
late final GlobalKey<FormState> formKey;

Future<void> resetPassword() async {
  if (formKey.currentState!.validate()) {
    emit(ResetPasswordLoading());
  
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
    showFlutterToast(message: AppStrings.check_your_email);
    emit(ResetPasswordSuccess());
  } catch (e) {
    log(e.toString());
    showFlutterToast(message: e.toString());
    emit(ResetPasswordError(errMessage: e.toString()));
  }
  emit(ResetPasswordInitial());
  }
}



@override
Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
