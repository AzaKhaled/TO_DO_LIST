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
        return macos;
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
    apiKey: 'AIzaSyD6NLtqe339g0KoQ2wUMmPq3265ZDHbWSE',
    appId: '1:40544831666:web:5187db702b46807c9b61ab',
    messagingSenderId: '40544831666',
    projectId: 'to-do-list-f941e',
    authDomain: 'to-do-list-f941e.firebaseapp.com',
    storageBucket: 'to-do-list-f941e.firebasestorage.app',
    measurementId: 'G-E7XVQ67HDW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYiqpcaKfMxWTtXLE8jUB6rZA6jIVbFzk',
    appId: '1:40544831666:android:726b333f06b154da9b61ab',
    messagingSenderId: '40544831666',
    projectId: 'to-do-list-f941e',
    storageBucket: 'to-do-list-f941e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzF7ZfM8Ntcg2FIjVojAFvx7JZYS3QlAU',
    appId: '1:40544831666:ios:46102c741bf6c3fe9b61ab',
    messagingSenderId: '40544831666',
    projectId: 'to-do-list-f941e',
    storageBucket: 'to-do-list-f941e.firebasestorage.app',
    iosBundleId: 'com.example.toDoList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzF7ZfM8Ntcg2FIjVojAFvx7JZYS3QlAU',
    appId: '1:40544831666:ios:46102c741bf6c3fe9b61ab',
    messagingSenderId: '40544831666',
    projectId: 'to-do-list-f941e',
    storageBucket: 'to-do-list-f941e.firebasestorage.app',
    iosBundleId: 'com.example.toDoList',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6NLtqe339g0KoQ2wUMmPq3265ZDHbWSE',
    appId: '1:40544831666:web:ebf19a66e4d97e9c9b61ab',
    messagingSenderId: '40544831666',
    projectId: 'to-do-list-f941e',
    authDomain: 'to-do-list-f941e.firebaseapp.com',
    storageBucket: 'to-do-list-f941e.firebasestorage.app',
    measurementId: 'G-0X1EDV7K6G',
  );

}