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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCYUhZl1H0-XKFnmY7UMYfiQAyHe8zyy8U',
    appId: '1:233845021787:web:76c32bf07effea86d2f37e',
    messagingSenderId: '233845021787',
    projectId: 'project-catatan-keuangan-5aef4',
    authDomain: 'project-catatan-keuangan-5aef4.firebaseapp.com',
    storageBucket: 'project-catatan-keuangan-5aef4.firebasestorage.app',
    measurementId: 'G-FJGMRW9SKM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSJWBME_EJZHgwApxgqdU_1Mzm7Q1edDM',
    appId: '1:233845021787:android:867f4d1506086121d2f37e',
    messagingSenderId: '233845021787',
    projectId: 'project-catatan-keuangan-5aef4',
    storageBucket: 'project-catatan-keuangan-5aef4.firebasestorage.app',
  );
}
