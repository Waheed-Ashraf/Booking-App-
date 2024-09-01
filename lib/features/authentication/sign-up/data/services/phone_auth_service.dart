import 'package:booking_depi_proj/core/errors/firebase_failure.dart';
import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

abstract class PhoneAuthService{

  final auth = FirebaseConstants.auth;

  void verifyAndSignup(String phone);

}

final class PhoneAuthServiceImp extends PhoneAuthService{
  @override
  void verifyAndSignup(String phone) {

    auth.verifyPhoneNumber(
        verificationCompleted: (credential)async{
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (authException){

          debugPrint('Fialure while auth using phone');
          if(authException.code == FirebaseConstants.invalidVerificationCode) {
            throw FirebaseAuthFailure.fromMessage(authException.code);
          }
          if(authException.code == FirebaseConstants.invalidVerificationId) {
            throw FirebaseAuthFailure.fromMessage(authException.code);
          }
          if(authException.code == FirebaseConstants.invalidCredential) {
            throw FirebaseAuthFailure.fromMessage(authException.code);
          }

        },
        codeSent: (verificationId, resendToken)async{
          // TODO: SHOW UI AND ACCEPT SMS CODE, YOU should return the code here
          // do that through alerting the cubit


          String smsCode = 'xxxx';

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (verificationId){

        },

    );

  }


}