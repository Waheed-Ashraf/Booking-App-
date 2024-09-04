import 'package:booking_depi_proj/core/errors/failuer.dart';
import 'package:booking_depi_proj/core/errors/phone_failure.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/data/repos/sign_in_repo/sign_in_repo.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/data/repositories/phone_auth_repo.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/data/services/phone_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInStates> {

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final BaseSignInRepo _signInRepo;
  late final BasePhoneAuthRepo _phoneAuthRepo;

  SignInCubit() : super(SignInInitial()){
    _signInRepo = SignInRepo();
    _phoneAuthRepo = PhoneAuthRepo(service: PhoneAuthServiceImp());

  }

  static SignInCubit getCubit(BuildContext context)=>BlocProvider.of(context);

  void signUserIn()async{

    emit(SignInLoadingState());

    if(phoneController.text.isEmpty || passwordController.text.isEmpty){
      emit(SignInFailureState(failure: IncorrectPhoneOrPasswordFailure()));
    }
    else{
      try{
        String internationalPhone = phoneController.text;

        if(!internationalPhone.startsWith('+')){
           internationalPhone = await _phoneAuthRepo.formatToInternationalNumber(internationalPhone);
        }
        if(await _signInRepo.isUserExist(phone: internationalPhone, password: passwordController.text)){
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

}
