import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class SecureStorage{

  static FlutterSecureStorage? _storage;

  SecureStorage._();

  static FlutterSecureStorage getInstance()=> _storage??= const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions:IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );


}