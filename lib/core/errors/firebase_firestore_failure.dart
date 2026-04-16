import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/errors/failure.dart';



class FireBaseFirestoreServerFailure extends Failure {
  FireBaseFirestoreServerFailure({required super.message});

  factory FireBaseFirestoreServerFailure.fromFireStore(FirebaseException exception) {
    // Handle different types of errors
    switch (exception.code) {
      case 'permission-denied':
        return FireBaseFirestoreServerFailure(
          message: 'You don\'t have permission to access this data',
        );
      case 'not-found':
        return FireBaseFirestoreServerFailure(
          message: 'The requested document was not found',
        );
      case 'already-exists':
        return FireBaseFirestoreServerFailure(
          message: 'The document already exists',
        );
      case 'resource-exhausted':
        return FireBaseFirestoreServerFailure(
          message: 'Resource limit exceeded. Please try again later',
        );
      case 'failed-precondition':
        return FireBaseFirestoreServerFailure(
          message: 'Operation cannot be performed at this time',
        );
      case 'aborted':
        return FireBaseFirestoreServerFailure(
          message: 'Operation aborted. Please try again',
        );
      case 'out-of-range':
        return FireBaseFirestoreServerFailure(
          message: 'The provided value is out of range',
        );
      case 'unimplemented':
        return FireBaseFirestoreServerFailure(
          message: 'This feature is not yet implemented',
        );
      case 'internal':
        return FireBaseFirestoreServerFailure(
          message: 'Internal server error. Please try again later',
        );
      case 'unavailable':
        return FireBaseFirestoreServerFailure(
          message:
              'Service is currently unavailable. Check your internet connection',
        );
      case 'data-loss':
        return FireBaseFirestoreServerFailure(
          message: 'Data loss occurred. Please try again',
        );
      case 'unauthenticated':
        return FireBaseFirestoreServerFailure(
          message: 'Please login first',
        );
      default:
        return FireBaseFirestoreServerFailure(
          message:
              'Server error: ${exception.message ?? 'An unexpected error occurred'}',
        );
    }
  }
  factory FireBaseFirestoreServerFailure.unexpectedError(dynamic error) {
    if (error is TimeoutException) {
      return FireBaseFirestoreServerFailure(
        message: 'Connection timeout. Please try again',
      );
    } else if (error is FormatException) {
      return FireBaseFirestoreServerFailure(
        message: 'Data format error from server',
      );
    } else if (error is TypeError) {
      log('Error: $error');
      return FireBaseFirestoreServerFailure(
        message: 'Data type error from server',
      );
    } else {
      // Log the error for debugging
      log('Unhandled error $error');

      return FireBaseFirestoreServerFailure(
        message: 'Unexpected error: ${error.toString()}',
      );
    }
  }
}
