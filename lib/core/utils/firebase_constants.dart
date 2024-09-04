import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class FirebaseConstants{

  static final auth = FirebaseAuth.instance;
  static final db = FirebaseFirestore.instance;


  // vars scope

  static const invalidVerificationCode = 'invalid-verification-code';
  static const invalidVerificationId = 'invalid-verification-id';
  static const invalidCredential = 'invalid-credential';


  // db collections

  static const usersCollection = 'users';

  // user scope
  static const currentUserUid = 'uid';
}