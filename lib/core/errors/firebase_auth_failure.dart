import 'package:dalel_app/core/errors/failure.dart';

class FirebaseAuthFailure extends Failure {
   FirebaseAuthFailure({required super.message});
   
   factory FirebaseAuthFailure.fromFirebaseAuthExceptionCode(String code) {
    switch (code) {
      case 'invalid-email':
        return FirebaseAuthFailure(message: 'Invalid email');
      case 'user-not-found':
        return FirebaseAuthFailure(message: 'User not found');
      case 'wrong-password':
        return FirebaseAuthFailure(message: 'Wrong password');
      case 'email-already-in-use':
        return FirebaseAuthFailure(message: 'Email already in use');
      default:
        return FirebaseAuthFailure(message: 'Wrong email or password');
    }
  }
  factory FirebaseAuthFailure.unVerifiedEmail() {
    return FirebaseAuthFailure(message: 'Please verify your email');
  }
  
  factory FirebaseAuthFailure.unexpectedError(){
    return FirebaseAuthFailure(message: 'oops, something went wrong, please try again');
  }
}