import 'dart:developer';

import 'package:dalel_app/core/errors/failure.dart';
import 'package:dalel_app/core/errors/firebase_auth_failure.dart';
import 'package:dalel_app/features/auth/presentation/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginRepoImpl implements LoginRepo {
  @override
  Future<Either<Failure, User?>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        if (user.emailVerified) {
          return Right(user);
        } else {
          await verifyEmail();
          return Left(FirebaseAuthFailure.unVerifiedEmail());
        }
      } else {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (userCredential.user!.emailVerified) {
          return Right(userCredential.user);
        } else {
        await  verifyEmail();
          return Left(FirebaseAuthFailure.unVerifiedEmail());
        }
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        log(e.toString());
        return Left(FirebaseAuthFailure.fromFirebaseAuthExceptionCode(e.code));
      } else {
        log(e.toString());
        return Left(FirebaseAuthFailure.unexpectedError());
      }
    }
  }

  @override
  bool validateFormData({required GlobalKey<FormState> formKey}) {
    return formKey.currentState!.validate();
  }

  @override
  Future<Either<Failure, void>> verifyEmail() async {
    try {
    FirebaseAuth firebaseAuthInstance =  FirebaseAuth.instance;
    await firebaseAuthInstance.currentUser!.sendEmailVerification();
      return Right(null);
    } catch (e) {
      log(e.toString());
      return Left(FirebaseAuthFailure.unexpectedError());
    }
  }
}
