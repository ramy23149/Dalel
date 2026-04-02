import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/errors/failure.dart';



class FireBaseServerFailure extends Failure {
  FireBaseServerFailure({required super.message});

  factory FireBaseServerFailure.fromFireStore(FirebaseException exception) {
    // Handle different types of errors
    switch (exception.code) {
      case 'permission-denied':
        return FireBaseServerFailure(
          message: 'You don\'t have permission to access this data',
        );
      case 'not-found':
        return FireBaseServerFailure(
          message: 'The requested document was not found',
        );
      case 'already-exists':
        return FireBaseServerFailure(
          message: 'The document already exists',
        );
      case 'resource-exhausted':
        return FireBaseServerFailure(
          message: 'Resource limit exceeded. Please try again later',
        );
      case 'failed-precondition':
        return FireBaseServerFailure(
          message: 'Operation cannot be performed at this time',
        );
      case 'aborted':
        return FireBaseServerFailure(
          message: 'Operation aborted. Please try again',
        );
      case 'out-of-range':
        return FireBaseServerFailure(
          message: 'The provided value is out of range',
        );
      case 'unimplemented':
        return FireBaseServerFailure(
          message: 'This feature is not yet implemented',
        );
      case 'internal':
        return FireBaseServerFailure(
          message: 'Internal server error. Please try again later',
        );
      case 'unavailable':
        return FireBaseServerFailure(
          message:
              'Service is currently unavailable. Check your internet connection',
        );
      case 'data-loss':
        return FireBaseServerFailure(
          message: 'Data loss occurred. Please try again',
        );
      case 'unauthenticated':
        return FireBaseServerFailure(
          message: 'Please login first',
        );
      default:
        return FireBaseServerFailure(
          message:
              'Server error: ${exception.message ?? 'An unexpected error occurred'}',
        );
    }
  }
  factory FireBaseServerFailure.unexpectedError(dynamic error) {
    if (error is TimeoutException) {
      return FireBaseServerFailure(
        message: 'Connection timeout. Please try again',
      );
    } else if (error is FormatException) {
      return FireBaseServerFailure(
        message: 'Data format error from server',
      );
    } else if (error is TypeError) {
      log('Error: $error');
      return FireBaseServerFailure(
        message: 'Data type error from server',
      );
    } else {
      // Log the error for debugging
      log('Unhandled error $error');

      return FireBaseServerFailure(
        message: 'Unexpected error: ${error.toString()}',
      );
    }
  }
}
