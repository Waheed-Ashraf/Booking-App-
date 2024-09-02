import 'dart:async';
import 'dart:developer';

import 'package:booking_depi_proj/core/errors/failuer.dart';
import 'package:booking_depi_proj/core/errors/firebase_failure.dart';
import 'package:booking_depi_proj/core/errors/phone_failure.dart';
import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

abstract class PhoneAuthService{

  final auth = FirebaseConstants.auth;
  final db = FirebaseConstants.db;

  Stream<String?> get verificationIdStream;

  Future<void> verifyPhone(String phone);

  Future<void> signUserUp({required String? verificationId, required String? smsCode, required String name});

}

final class PhoneAuthServiceImp extends PhoneAuthService{

  StreamController<String?>  verificationIdStreamController= StreamController();
  String? verificationId;

  PhoneAuthServiceImp(){
    Timer.periodic(Duration(seconds: 1), (timer){
      verificationIdStreamController.sink.add(verificationId);
      log('ver Id before adding to stream : $verificationId ');
      if(verificationId!= null){
        verificationIdStreamController.close();
        timer.cancel();
      }
    });
  }
  @override
  Future<void> verifyPhone(String phone)async{
    log('formatted phone : $phone');
    await auth.verifyPhoneNumber(
      phoneNumber: phone,

        verificationCompleted: (credential)async{
          log('verification completed, what then');
        },
        verificationFailed: (authException){

          debugPrint('Failure while auth using phone');
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
        codeSent: (verifyId, resendToken)async{

          verificationId = verifyId;
          log('code sent, what then and verif id : $verificationId');

        },
        codeAutoRetrievalTimeout: (verificationId){
          log('Auto-retreival timeout, what then');
        },

    );

  }

  @override
  Future<void> signUserUp({required String? verificationId, required String? smsCode, required String name})async{
    if(smsCode == null || verificationId == null){

      throw IncorrectSmsFailure();
    }else{

      if(smsCode.isEmpty || verificationId.isEmpty){
        throw IncorrectSmsFailure();
      }
      else{
        UserCredential userCredential;

        try{
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
          userCredential = await auth.signInWithCredential(credential);
        }
        on FirebaseException catch (exception){
          throw FirebaseAuthFailure.fromMessage(exception.code);
        }
        catch (e){
          throw IncorrectSmsFailure();
        }

        try{
          await  db.collection(FirebaseConstants.usersCollection).doc(userCredential.user?.uid).set(
              {
                'name' : name,
                'phone': userCredential.user?.phoneNumber,
                'signing-method' : 'phone',
              }
          );
        }
        on FirebaseException catch (exception){
          throw FirebaseAuthFailure.fromMessage(exception.code);
        }
        catch (e){
          throw FirebaseAuthFailure.fromMessage(e.toString());
        }
      }
    }

  }

  @override
  Stream<String?> get verificationIdStream => verificationIdStreamController.stream;


}