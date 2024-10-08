// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCMfRpqcqLL4qsHjx99CcwjpnFL8NQLutU',
    appId: '1:750375591875:web:86fccb28479b8458b12776',
    messagingSenderId: '750375591875',
    projectId: 'ehgezly-4e640',
    authDomain: 'ehgezly-4e640.firebaseapp.com',
    storageBucket: 'ehgezly-4e640.appspot.com',
    measurementId: 'G-MPTC4WJC94',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDQMmJgdHiK6mwAe2kYThgwFirTwyPGSs',
    appId: '1:750375591875:android:d29c51248c921001b12776',
    messagingSenderId: '750375591875',
    projectId: 'ehgezly-4e640',
    storageBucket: 'ehgezly-4e640.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_BCNsI74t4Xvr6m9JdzOfBLk6-S3r_Hc',
    appId: '1:750375591875:ios:7c3c2e3dad1e9bd2b12776',
    messagingSenderId: '750375591875',
    projectId: 'ehgezly-4e640',
    storageBucket: 'ehgezly-4e640.appspot.com',
    iosBundleId: 'com.example.bookingDepiProj',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCMfRpqcqLL4qsHjx99CcwjpnFL8NQLutU',
    appId: '1:750375591875:web:0ac4f31d2927911fb12776',
    messagingSenderId: '750375591875',
    projectId: 'ehgezly-4e640',
    authDomain: 'ehgezly-4e640.firebaseapp.com',
    storageBucket: 'ehgezly-4e640.appspot.com',
    measurementId: 'G-EVM3PYGR8B',
  );

}