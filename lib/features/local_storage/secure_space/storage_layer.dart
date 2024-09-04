import 'dart:async';
import 'dart:convert';

import 'package:booking_depi_proj/core/utils/firebase_constants.dart';
import 'package:booking_depi_proj/features/local_storage/secure_space/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class SecureStorageLayer {
  static final FlutterSecureStorage _storage = SecureStorage.getInstance();

  /// stores the value associated with its key encrypted in the disk
  static void putValue({required String key, required dynamic value}) async {
    if (value is int || value is double || value is bool) {
      await _storage.write(key: key, value: value.toString());
    } else if (value is List || value is Map || value is Set) {
      await _storage.write(key: key, value: jsonEncode(value));
    }
    // for normal strings
    else {
      await _storage.write(key: key, value: value);
    }
  }

  /// returns the value associated with that key, if not found ''(Empty String) is returned
  static Future<dynamic> getValue({required String key}) async {
    final String? value = await _storage.read(key: key);

    if (value == null) {
      return '';
    } else {
      if (double.tryParse(value) != null) {
        return double.parse(value);
      } else if (int.tryParse(value) != null) {
        return int.parse(value);
      } else if (jsonDecode(value) is List) {
        // for List
        return List.from(jsonDecode(value));
      } else if (jsonDecode(value) is Map) {
        // Map or Set
        return Map.from(jsonDecode(jsonDecode(value)));

      }else if(jsonDecode(value) is Set){
        return Set.from(jsonDecode(value));
      }
      else if (value == 'true' || value == 'false') {
        return bool.fromEnvironment(value);
      } else {
        return value.toString();
      }
    }
  }

  /// get current user uid, doesn't matter the auth method, but this method should be called after getting home page not further
  /// so that, it's guaranteed to have an authenticated user.
  static FutureOr<String> getCurrentUserUid()async{
    if(FirebaseConstants.auth.currentUser != null){
      return FirebaseConstants.auth.currentUser!.uid;
    }
    else{
      return await getValue(key: FirebaseConstants.currentUserUid);
    }
  }
}
