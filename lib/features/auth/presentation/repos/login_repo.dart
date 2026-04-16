import 'package:dalel_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginRepo {
bool validateFormData({required GlobalKey<FormState> formKey});

Future<Either<Failure, User?>> loginWithEmailAndPassword({required String email, required String password});

Future<Either<Failure, void>> verifyEmail();
}