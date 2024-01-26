// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyAzyeeIy3EYrrMYdiOLlpFpIraIVrQqdB0',
    appId: '1:157247432892:web:82d27f64ac3e2acb5008b9',
    messagingSenderId: '157247432892',
    projectId: 'lettutor-407509',
    authDomain: 'lettutor-407509.firebaseapp.com',
    storageBucket: 'lettutor-407509.appspot.com',
    measurementId: 'G-CNSB2HLF4K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6C1GEQSHsOQTLBqZOvzcRzssu0F9O7rI',
    appId: '1:157247432892:android:8b469ebb2852a9b55008b9',
    messagingSenderId: '157247432892',
    projectId: 'lettutor-407509',
    storageBucket: 'lettutor-407509.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChfpK6cGLFlwxvKu81EvwMfD4fglVfWwU',
    appId: '1:157247432892:ios:59f91e599ca3d0965008b9',
    messagingSenderId: '157247432892',
    projectId: 'lettutor-407509',
    storageBucket: 'lettutor-407509.appspot.com',
    androidClientId: '157247432892-sqk0gq6q94c2be14uq0v23qfmol34pno.apps.googleusercontent.com',
    iosBundleId: 'com.example.letTutor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChfpK6cGLFlwxvKu81EvwMfD4fglVfWwU',
    appId: '1:157247432892:ios:c419179947da15a65008b9',
    messagingSenderId: '157247432892',
    projectId: 'lettutor-407509',
    storageBucket: 'lettutor-407509.appspot.com',
    androidClientId: '157247432892-sqk0gq6q94c2be14uq0v23qfmol34pno.apps.googleusercontent.com',
    iosBundleId: 'com.example.letTutor.RunnerTests',
  );
}
