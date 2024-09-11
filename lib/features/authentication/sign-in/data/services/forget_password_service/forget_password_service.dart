import 'package:booking_depi_proj/core/errors/firebase_failure.dart';
import 'package:booking_depi_proj/core/errors/phone_failure.dart';
import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseForgetPasswordService {
  final db = FirebaseConstants.db;
  final auth = FirebaseConstants.auth;

  Future<bool> isPhoneRegistered({required String formattedPhone});

  Future<void> updatePassword({required String formattedPhone, required String newPassword});

  Future<void> isSmsCorrectAndSignUserIn({required String smsCode, required String verificationId});
}

final class ForgetPasswordService extends BaseForgetPasswordService {
  @override
  Future<bool> isPhoneRegistered({required String formattedPhone}) async {
    try {
      var resultSet = await db
          .collection(FirebaseConstants.usersCollection)
          .where('phone', isEqualTo: formattedPhone)
          .get();

      return (resultSet.size == 1);
    } on FirebaseException catch (exception) {
      throw GeneralFireStoreFailure();
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<void> isSmsCorrectAndSignUserIn({required String smsCode, required String verificationId})async{
    UserCredential userCredential;

    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      userCredential = await auth.signInWithCredential(credential);
    }
    catch(e){
      throw IncorrectSmsFailure();
    }
  }
  @override
  Future<void> updatePassword({required String formattedPhone, required String newPassword}) async {
    try {
      var resultSet = await db
          .collection(FirebaseConstants.usersCollection)
          .where('phone', isEqualTo: formattedPhone)
          .get();

      var userDoc = resultSet.docs.first;
      Map<String,dynamic> userData = userDoc.data();
      userData['password'] = newPassword;

      await db.collection(FirebaseConstants.usersCollection).doc(userDoc.id).set(userData);

    } on FirebaseException catch (exception) {
      throw GeneralFireStoreFailure();
    } catch (e) {
      rethrow;
    }
  }
}
