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
    apiKey: 'AIzaSyA4sMx0FSBdWvbFqOXVtqguDMAncI8cQsY',
    appId: '1:774509532820:web:f6f4d9e897229d05ecc681',
    messagingSenderId: '774509532820',
    projectId: 'tiktok-clone-707da',
    authDomain: 'tiktok-clone-707da.firebaseapp.com',
    storageBucket: 'tiktok-clone-707da.appspot.com',
    measurementId: 'G-MSH4YR7B6V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAowni9AREPk-yLX0gWeqIVQJATFWuTQAw',
    appId: '1:774509532820:android:1cec2b7750421fd2ecc681',
    messagingSenderId: '774509532820',
    projectId: 'tiktok-clone-707da',
    storageBucket: 'tiktok-clone-707da.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJatWY7MfigUHuxtGlRY-k5NswC5Xmiww',
    appId: '1:774509532820:ios:2ab46b324168d26eecc681',
    messagingSenderId: '774509532820',
    projectId: 'tiktok-clone-707da',
    storageBucket: 'tiktok-clone-707da.appspot.com',
    androidClientId: '774509532820-9v9nmelape7pa2epmkff5pbjnhunphrv.apps.googleusercontent.com',
    iosClientId: '774509532820-vabhlgom2gi8ubu2n83quqt5mcd80uig.apps.googleusercontent.com',
    iosBundleId: 'com.example.tiktokClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJatWY7MfigUHuxtGlRY-k5NswC5Xmiww',
    appId: '1:774509532820:ios:2ab46b324168d26eecc681',
    messagingSenderId: '774509532820',
    projectId: 'tiktok-clone-707da',
    storageBucket: 'tiktok-clone-707da.appspot.com',
    androidClientId: '774509532820-9v9nmelape7pa2epmkff5pbjnhunphrv.apps.googleusercontent.com',
    iosClientId: '774509532820-vabhlgom2gi8ubu2n83quqt5mcd80uig.apps.googleusercontent.com',
    iosBundleId: 'com.example.tiktokClone',
  );
}
