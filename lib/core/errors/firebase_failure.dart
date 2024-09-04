import 'package:booking_depi_proj/core/utils/firebase_constants.dart';

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

final class GeneralFireStoreFailure extends Failure{

  GeneralFireStoreFailure():super('Couldn\'t make R/W right now, check You Internet or try later');
}
