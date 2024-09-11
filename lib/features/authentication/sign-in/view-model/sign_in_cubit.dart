import 'dart:async';
import 'dart:developer';

import 'package:booking_depi_proj/core/errors/failuer.dart';
import 'package:booking_depi_proj/core/errors/phone_failure.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/data/repos/forget_password_repo/forget_password_repo.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/data/repos/sign_in_repo/sign_in_repo.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/data/services/forget_password_service/forget_password_service.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/data/repositories/phone_auth_repo.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/data/services/phone_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInStates> {

  late final BaseSignInRepo _signInRepo;
  late final BasePhoneAuthRepo _phoneAuthRepo;
  late final BaseForgetPasswordRepo _forgetPasswordRepo;
  String tempPhone = '';
  String tempVerificationId = '';
  late StreamSubscription<String?> verIdStreamSubscription;
  bool isBottomSheetOpen = false;

  SignInCubit() : super(SignInInitial()){
    _signInRepo = SignInRepo();
    _phoneAuthRepo = PhoneAuthRepo(service: PhoneAuthServiceImp());

      verIdStreamSubscription = _phoneAuthRepo.verificationIdStream.listen(
              (String? verId) {
            print('WAITING FOR THAT ID IN CUBIT');
            if (verId != null && verId.isNotEmpty) {
              print('Got id: $verId');
              tempVerificationId = verId;
              cancelSubscription(); // Properly cancel the subscription after receiving the ID
            }
          }
      );

    _forgetPasswordRepo = ForgetPasswordRepo(forgetPasswordService: ForgetPasswordService());
  }

  static SignInCubit getCubit(BuildContext context)=>BlocProvider.of(context);

  void signUserIn({required String phone, required String password})async{

    emit(SignInLoadingState());

    if(phone.isEmpty || password.isEmpty){
      emit(SignInFailureState(failure: IncorrectPhoneOrPasswordFailure()));
    }
    else{
      try{
        String internationalPhone = phone;

        if(!internationalPhone.startsWith('+')){
           internationalPhone = await _phoneAuthRepo.formatToInternationalNumber(internationalPhone);
        }
        if(await _signInRepo.isUserExist(phone: internationalPhone, password: password)){
          emit(SignInSuccessState());
        }
        else{
          emit(SignInFailureState(failure: IncorrectPhoneOrPasswordFailure()));
        }
      }
      on Failure catch(failure){
        emit(SignInFailureState(failure: failure));
      }
      catch(e){
        emit(SignInFailureState(failure: UnknownFailure('Some thing went wrong !')));
      }
    }
  }

  void userForgetPassword(){
    emit(WannaEnterPhoneInForgottenPassword());
  }

  void verifyPhoneInForgetPassword({required String phone})async{
    emit(SignInLoadingState());
    try{
      var formattedPhone = await _phoneAuthRepo.formatToInternationalNumber(phone);
      bool isExistentUser = await _forgetPasswordRepo.isPhoneRegistered(formattedPhone: formattedPhone);
      if(!isExistentUser){
        throw PhoneNotRegisteredFailure();
      }
      tempPhone = formattedPhone;

      log('phone is : $tempPhone');
      emit(ForgetPasswordPhoneRegisteredState());
    }
    on Failure catch(failure){
      emit(SignInFailureState(failure: failure));
    }
    catch(e){
      emit(SignInFailureState(failure: UnknownFailure('Something went wrong !')));
    }

  }

  void sendSmsToPhone()async{
    if(tempPhone.isEmpty){
      emit(SignInFailureState(failure: UnknownFailure('Phone is not exist, try again')));
      return ;
    }
    try{
      await _phoneAuthRepo.verifyPhone(tempPhone);
    }
    on Failure catch (failure){
      emit(SignInFailureState(failure: failure));
    }
    catch (e){
      emit(SignInFailureState(failure: UnknownFailure('Somthing went wrong while sending message!!')));
    }

  }

  void verifySmsCode({required List<TextEditingController> codeControllers})async{
    String sms = '';
    for(var controller in codeControllers){
      sms += controller.text;
    }
    try{
      print('sms is : $sms , ver id : $tempVerificationId');
      await _forgetPasswordRepo.isSmsCorrectAndSignUserIn(smsCode: sms, verificationId: tempVerificationId);
      emit(ForgetPasswordShowChangePasswordState());
      //TODO:

    }
    on Failure catch(failure){
      emit(SignInFailureState(failure: failure));
    }
    catch(e){
      emit(SignInFailureState(failure: UnknownFailure('Either code or verification id not valid')));
    }
  }

  void resetPassword({required String firstPassword, required String secondPassword})async {
    if (firstPassword != secondPassword) {
      emit(SignInFailureState(
          failure: UnknownFailure('Passwords are not the same !!')));
      return;
    }
    emit(SignInLoadingState());
    try {
      await _forgetPasswordRepo.updatePassword(
          formattedPhone: tempPhone, newPassword: firstPassword);

      emit(ForgetPasswordSuccessfullyReset());
    }
    on Failure catch (failure) {
      emit(SignInFailureState(failure: failure));
    }
    catch (e) {
      emit(SignInFailureState(failure: UnknownFailure(
          'Can\'t update your password, try again later!')));
    }
  }

  void cancelSubscription()async{
    await verIdStreamSubscription.cancel();
  }

}
