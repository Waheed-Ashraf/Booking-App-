import 'package:booking_depi_proj/core/errors/failuer.dart';
import 'package:booking_depi_proj/core/errors/firebase_failure.dart';
import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:booking_depi_proj/features/local_storage/secure_space/storage_layer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

sealed class BaseSignInService {
  final db = FirebaseConstants.db;

  Future<bool> isUserExist({required String phone, required String password});
}

final class SignInService extends BaseSignInService {
  @override
  Future<bool> isUserExist(
      {required String phone, required String password}) async {
    try{
      QuerySnapshot<Map<String, dynamic>> searchResultSet = await db
          .collection(FirebaseConstants.usersCollection)
          .where(
        'phone',
        isEqualTo: phone,
      )
          .where('password', isEqualTo: password)
          .get();
      if(searchResultSet.size == 1){// user is found , if 0 means it's not found
        // store user id to access his data (phone, name) later
        SecureStorageLayer.putValue(key: FirebaseConstants.currentUserUid, value: searchResultSet.docs.first.id);
        return true;
      }
      return false;
    }
    on FirebaseAuthException catch(e){
      throw FirebaseAuthFailure.fromMessage(e.code);
    }
    on FirebaseException catch(e){
      throw GeneralFireStoreFailure();
    }
    catch(e){
      throw UnknownFailure('Something went wrong!');
    }

  }
}
