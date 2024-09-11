import 'package:booking_depi_proj/features/authentication/sign-in/data/services/forget_password_service/forget_password_service.dart';

abstract class BaseForgetPasswordRepo {
  BaseForgetPasswordService _forgetPasswordService;

  BaseForgetPasswordRepo(
      {required BaseForgetPasswordService forgetPasswordService})
      : _forgetPasswordService = forgetPasswordService;

  Future<bool> isPhoneRegistered({required String formattedPhone});

  Future<void> updatePassword(
      {required String formattedPhone, required String newPassword});

  Future<void> isSmsCorrectAndSignUserIn({required String smsCode, required String verificationId});
}

final class ForgetPasswordRepo extends BaseForgetPasswordRepo{

  ForgetPasswordRepo({required super.forgetPasswordService});

  @override
  Future<bool> isPhoneRegistered({required String formattedPhone})async{
    return await _forgetPasswordService.isPhoneRegistered(formattedPhone: formattedPhone);
  }

  @override
  Future<void> updatePassword(
      {required String formattedPhone, required String newPassword})async{
    await _forgetPasswordService.updatePassword(formattedPhone: formattedPhone, newPassword: newPassword);
  }

  @override
  Future<void> isSmsCorrectAndSignUserIn({required String smsCode, required String verificationId})async{
    await _forgetPasswordService.isSmsCorrectAndSignUserIn(smsCode: smsCode, verificationId: verificationId);
  }
}