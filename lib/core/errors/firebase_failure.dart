import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:firebase_core/firebase_core.dart';

import 'failuer.dart';

final class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.errMessage);

  factory FirebaseAuthFailure.fromMessage(String message) {
    return switch (message) {
      FirebaseConstants.invalidVerificationCode =>
        FirebaseAuthFailure('You have entered Invalid Verification Code'),
      FirebaseConstants.invalidVerificationId =>
        FirebaseAuthFailure('Some thing went wrong while signing you'),
      FirebaseConstants.invalidCredential =>
        FirebaseAuthFailure('Invalid Credential, verify your data'),
      _ => FirebaseAuthFailure('Unknown Error occurred, try again later'),
    };
  }
}
