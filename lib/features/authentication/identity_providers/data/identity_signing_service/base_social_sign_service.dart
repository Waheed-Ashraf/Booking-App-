import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseSocialSigningService{

  final auth = FirebaseConstants.auth;
  final db = FirebaseConstants.db;

  Future<void> mergeEmailsForExistentUser({required FirebaseAuthException authException})async{
    if (authException.code == 'account-exists-with-different-credential') {
      final email = authException.email!;
      final credential = authException.credential!;
      print('CONFLICT EMAIL IS : $email');

      // Retrieve the existing sign-in method for the email
      final List<String> signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      print('SIGNN IN METHODS : $signInMethods');
      //check existent sign in methods like (google .. facebook and other)

      for (final method in signInMethods) {
        if (method.contains('google')) {
          final facebookCredential = FacebookAuthProvider.credential(credential.accessToken!);
          // Sign in with Google
          // Link Google credentials
          await FirebaseAuth.instance.currentUser?.linkWithCredential(facebookCredential);
        }
        else if (method.contains('facebook')) {
          // Sign in with Facebook
          final googleCredential = GoogleAuthProvider.credential(
            idToken: credential.token.toString(),
            accessToken: credential.accessToken,
          );
          // Link Facebook credentials
          await FirebaseAuth.instance.currentUser?.linkWithCredential(googleCredential);
        }
      }
    }
  }
  Future<void> saveUserData(UserCredential user)async{

    await db.collection(FirebaseConstants.usersCollection).doc(user.user?.uid).set({
      'name' : user.user?.displayName??'',
      'phone' : user.user?.phoneNumber??'',
      'image' : user.user?.photoURL??'',
      'email' : user.user?.email??'',
    });
  }

  Future<void> signOutFromAll()async{
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();

  }

}