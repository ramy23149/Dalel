import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromFireStore(FirebaseException exception) {
    // Handle different types of errors
    switch (exception.code) {
      case 'permission-denied':
        return ServerFailure(
          message: 'You don\'t have permission to access this data',
        );
      case 'not-found':
        return ServerFailure(
          message: 'The requested document was not found',
        );
      case 'already-exists':
        return ServerFailure(
          message: 'The document already exists',
        );
      case 'resource-exhausted':
        return ServerFailure(
          message: 'Resource limit exceeded. Please try again later',
        );
      case 'failed-precondition':
        return ServerFailure(
          message: 'Operation cannot be performed at this time',
        );
      case 'aborted':
        return ServerFailure(
          message: 'Operation aborted. Please try again',
        );
      case 'out-of-range':
        return ServerFailure(
          message: 'The provided value is out of range',
        );
      case 'unimplemented':
        return ServerFailure(
          message: 'This feature is not yet implemented',
        );
      case 'internal':
        return ServerFailure(
          message: 'Internal server error. Please try again later',
        );
      case 'unavailable':
        return ServerFailure(
          message:
              'Service is currently unavailable. Check your internet connection',
        );
      case 'data-loss':
        return ServerFailure(
          message: 'Data loss occurred. Please try again',
        );
      case 'unauthenticated':
        return ServerFailure(
          message: 'Please login first',
        );
      default:
        return ServerFailure(
          message:
              'Server error: ${exception.message ?? 'An unexpected error occurred'}',
        );
    }
  }
  factory ServerFailure.unexpectedError(dynamic error) {
    if (error is TimeoutException) {
      return ServerFailure(
        message: 'Connection timeout. Please try again',
      );
    } else if (error is FormatException) {
      return ServerFailure(
        message: 'Data format error from server',
      );
    } else if (error is TypeError) {
      return ServerFailure(
        message: 'Data type error from server',
      );
    } else {
      // Log the error for debugging
      log('Unhandled error $error');

      return ServerFailure(
        message: 'Unexpected error: ${error.toString()}',
      );
    }
  }
}
