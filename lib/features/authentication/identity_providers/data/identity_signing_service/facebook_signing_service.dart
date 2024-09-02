import 'package:booking_depi_proj/core/errors/failuer.dart';
import 'package:booking_depi_proj/core/errors/firebase_failure.dart';
import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/data/identity_signing_service/base_social_sign_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseFacebookSignInService extends BaseSocialSigningService{

  Future<void> signInWithFacebook();
}

final class FacebookSignInService extends BaseFacebookSignInService{
  @override
  Future<void> signInWithFacebook() async{
    try {
     await signOutFromAll();

      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {

        final OAuthCredential credential = FacebookAuthProvider.credential(
          loginResult.accessToken!.tokenString,
        );

        // Sign in with the credential
        UserCredential userCredential = await auth.signInWithCredential(credential);

        await saveUserData(userCredential);
      }
      else if (loginResult.status == LoginStatus.cancelled) {
        return ;
      }
      else if (loginResult.status == LoginStatus.failed) {
        throw FirebaseAuthFailure('Failed to sign you up using facebook, do you really have one !!');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential'){
        mergeEmailsForExistentUser(authException: e);
      }
      else{
        throw FirebaseAuthFailure.fromMessage(e.code);
      }

    } catch (e) {

      throw UnknownFailure(e.toString());
    }
    return;
  }

  Future<void> signOut() async {
    await auth.signOut();
    await FacebookAuth.instance.logOut();
  }

}