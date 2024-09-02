import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:booking_depi_proj/core/errors/firebase_failure.dart';
import 'package:booking_depi_proj/core/errors/phone_failure.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/data/repositories/phone_auth_repo.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/data/services/phone_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failuer.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {

  bool agreeOnTerms = false;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  late final BasePhoneAuthRepo _phoneAuthRepo;

  String? smsCode;
  String? verificationId;

  SignUpCubit() : super(SignUpInitial()){
    _phoneAuthRepo = PhoneAuthRepo(service: PhoneAuthServiceImp());
    _phoneAuthRepo.verificationIdStream.listen(
        (String? verifiedId){
          if(verifiedId != null){
            verificationId = verifiedId;
            log('ver Id received in stream : $verificationId ');
          }
        },
    );
  }

  static SignUpCubit getCubit(BuildContext context)=>BlocProvider.of(context);

  void wannaVerifyData()async{
    log('passed phone is : ${phoneController.text}');
    try{
      emit(SignUpLoadingState());
      await _phoneAuthRepo.verifyPhone(phoneController.text);
      showBottomSheetToGetSentCode();
    }
    on Failure catch(failure){
      emit(SignUpVerificationFailureState(failure: failure));
    }
    catch (unknown){
      emit(SignUpVerificationFailureState(failure: UnknownFailure(unknown.toString())));
    }

  }

  void showBottomSheetToGetSentCode(){
    print('WILL EMIT BOTTOM SHEET STATE');
    emit(SignUpShowCodeBottomSheetState());
  }

  void finallySignUp()async{

    try{
      await _phoneAuthRepo.signUserUp(verificationId: verificationId!, smsCode: smsCode, name: nameController.text);
      emit(SignUpSuccessState());
    }
    on Failure catch (failure){
      emit(SignUpVerificationFailureState(failure: failure));
    }
    catch (e){
      emit(SignUpVerificationFailureState(failure: UnknownFailure('Something went wrong, try later')));
    }
  }

  void changeAgreeOnTerms(bool? newValue){
    agreeOnTerms = !agreeOnTerms;
    log('this is agree in cubit: $agreeOnTerms');
    emit(SignUpAgreeOnTermsChanged());
  }
  void userDidNotAgreed(){
    emit(SignUpUserDidNotAgreedOnTerms());
  }

  void setSmsCodeAndSignUp(List<TextEditingController> codeControllers){
    var accumulator = '';
    for(var controller in codeControllers){
      accumulator += controller.text;
    }
    smsCode = accumulator;
    finallySignUp();
  }

}
