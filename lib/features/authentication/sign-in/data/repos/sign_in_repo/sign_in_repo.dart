import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/data/services/sign_in_service/sign_in_service.dart';

abstract class BaseSignInRepo {
  BaseSignInService signInService;

  BaseSignInRepo({required this.signInService});

  Future<bool> isUserExist({required String phone, required String password});
}

final class SignInRepo extends BaseSignInRepo {
  SignInRepo() : super(signInService: SignInService());

  @override
  Future<bool> isUserExist(
      {required String phone, required String password}) async {
    return await signInService.isUserExist(phone: phone, password: password);
  }
}
