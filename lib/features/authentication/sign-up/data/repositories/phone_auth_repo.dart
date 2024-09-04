import 'dart:developer';

import 'package:booking_depi_proj/core/errors/phone_failure.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/data/services/phone_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

abstract class BasePhoneAuthRepo{
  PhoneAuthService service;
  BasePhoneAuthRepo({required this.service});

  Stream<String?> get verificationIdStream;

  Future<void> verifyPhone(String phone);

  Future<void> signUserUp({required String? verificationId, required String? smsCode, required String name,  required String password});

  Future<String> formatToInternationalNumber(String phone);
}

final class PhoneAuthRepo extends BasePhoneAuthRepo{
  PhoneAuthRepo({required super.service});

  @override
  Stream<String?> get verificationIdStream =>service.verificationIdStream;

  @override
  Future<void> verifyPhone(String phone) async{

   try{
     var formattedPhone = await formatToInternationalNumber(phone);
     await service.verifyPhone(formattedPhone);
   }
   catch(e){
     rethrow;
   }
  }

  @override
  Future<void> signUserUp({required String? verificationId, required String? smsCode, required String name,  required String password})async{
    await service.signUserUp(verificationId: verificationId, smsCode: smsCode, name: name, password:  password);
  }
  @override
  Future<String> formatToInternationalNumber(String phone) async {

    PhoneNumber number;
  try{
    // obtain country ISO Code such US for United States and EG for Egypt
    Locale deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    String countryCode = deviceLocale.countryCode!;
    if (phone.isEmpty) {
      throw PhoneParsingFailure('Phone number cannot be empty.');
    }

     number = await PhoneNumber.getRegionInfoFromPhoneNumber(
      phone,
      countryCode,
    );

    return number.phoneNumber!;  // e.g. +2 012XXXXXXXX for egypt

  }
  on MissingPluginException catch (e) {
    log('Plugin missing: ${e.toString()}');
    // Handle plugin-specific errors here
    throw PhoneParsingFailure('Phone number parsing is not available on this platform MPE.');
  }
  catch(e){
    log('type : ${e.runtimeType}, ${e.toString()}, ');
    throw PhoneParsingFailure('Don\'t write your phone in international, and revalidate');
   }
  }

}