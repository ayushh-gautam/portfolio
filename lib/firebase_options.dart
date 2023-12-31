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
    apiKey: 'AIzaSyCZxg6QTLKqmy-foixlduJ7N_9Vi7i_SdY',
    appId: '1:385186272792:web:2253111368d7f9733b556d',
    messagingSenderId: '385186272792',
    projectId: 'portfolio-9383c',
    authDomain: 'portfolio-9383c.firebaseapp.com',
    storageBucket: 'portfolio-9383c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBptQtDc35kYbsg5MQ7bhCNZa1ieCxTSXk',
    appId: '1:385186272792:android:620b95a9d9c8a3043b556d',
    messagingSenderId: '385186272792',
    projectId: 'portfolio-9383c',
    storageBucket: 'portfolio-9383c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpLXntzFK07UuUClwYM3JUkKfFz03rjP4',
    appId: '1:385186272792:ios:a557a4521cf2a5c33b556d',
    messagingSenderId: '385186272792',
    projectId: 'portfolio-9383c',
    storageBucket: 'portfolio-9383c.appspot.com',
    iosClientId: '385186272792-flndg7gbbovljd66fsj4a82c19o1r7d5.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfolio',
  );
}
