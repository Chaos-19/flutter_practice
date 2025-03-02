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
    apiKey: 'AIzaSyCIHpWgpa7cSJt39AwFwnthbz7M3ZVhENE',
    appId: '1:736141404526:web:388f4cec5faf729403397f',
    messagingSenderId: '736141404526',
    projectId: 'e-commerce-dev-d53c5',
    authDomain: 'e-commerce-dev-d53c5.firebaseapp.com',
    storageBucket: 'e-commerce-dev-d53c5.firebasestorage.app',
    measurementId: 'G-YEK043GLDQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSjXg8XscN3_lxf_bGaW0W3dYHffb_fs0',
    appId: '1:736141404526:android:f8912df7f866cf3e03397f',
    messagingSenderId: '736141404526',
    projectId: 'e-commerce-dev-d53c5',
    storageBucket: 'e-commerce-dev-d53c5.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDybb-eD1nQ0aMtoBriomIthRnzzwQJNaw',
    appId: '1:736141404526:web:bcb5f1ed4f29dbce03397f',
    messagingSenderId: '736141404526',
    projectId: 'e-commerce-dev-d53c5',
    authDomain: 'e-commerce-dev-d53c5.firebaseapp.com',
    storageBucket: 'e-commerce-dev-d53c5.firebasestorage.app',
    measurementId: 'G-RQXH7GDMQ2',
  );
}
