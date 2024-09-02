import 'package:booking_depi_proj/features/authentication/identity_providers/data/identity_signing_service/facebook_signing_service.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/data/identity_signing_service/google_signing_service.dart';

abstract class BaseIdentityProvidersSigningRepo{

  // method dependency injection based, preferred when one repo works with multi services
  Future<void> signInWithGoogle({required BaseGoogleSignInService googleService});
  Future<void> signInWithFacebook({required BaseFacebookSignInService facebookService});
}

final class IdentityProvidersSigningRepo extends BaseIdentityProvidersSigningRepo{

  @override
  Future<void> signInWithGoogle({required BaseGoogleSignInService googleService})async{
    await googleService.signInWithGoogle();
  }
  @override
  Future<void> signInWithFacebook({required BaseFacebookSignInService facebookService})async{
    await facebookService.signInWithFacebook();
  }


}