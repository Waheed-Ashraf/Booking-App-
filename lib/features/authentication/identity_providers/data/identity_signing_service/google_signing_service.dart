import 'package:booking_depi_proj/core/errors/failuer.dart';
import 'package:booking_depi_proj/core/errors/firebase_failure.dart';
import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/data/identity_signing_service/base_social_sign_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseGoogleSignInService extends BaseSocialSigningService{

  Future<void> signInWithGoogle();
}

final class GoogleSignInService extends BaseGoogleSignInService{
  @override
  Future<void> signInWithGoogle() async{

    try {
     await signOutFromAll();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
          return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await auth.signInWithCredential(credential);
      await saveUserData(userCredential);
    }
    on FirebaseAuthException catch(e){
      if (e.code == 'account-exists-with-different-credential'){
        mergeEmailsForExistentUser(authException: e);
      }
      else{
        throw FirebaseAuthFailure.fromMessage(e.code);
      }

  }
  catch (e){

      throw UnknownFailure('something went wrong while signing you in using google provider ');
  }
  }
  Future<void> signOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

}