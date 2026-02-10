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
  void _init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    lastNameController = TextEditingController();
    firstNameController = TextEditingController();
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
    final credential =  await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
       log("user ${credential.user} created successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }
}
