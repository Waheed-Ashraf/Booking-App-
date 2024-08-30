import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final class FirebaseConstants{

  static final auth = FirebaseAuth.instance;

  // vars scope

  static const invalidVerificationCode = 'invalid-verification-code';
  static const invalidVerificationId = 'invalid-verification-id';
  static const invalidCredential = 'invalid-credential';
}