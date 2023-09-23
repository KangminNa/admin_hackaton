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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgb5fHACTDQVbbYdlN940mFctmwVhEJtA',
    appId: '1:190215607067:android:880f34163cae33695d39be',
    messagingSenderId: '190215607067',
    projectId: 'admin-hackaton',
    storageBucket: 'admin-hackaton.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqrpNyvYRhPIu3O-NqRXkz8M1JRS0DdJ0',
    appId: '1:190215607067:ios:8fda65816ec492815d39be',
    messagingSenderId: '190215607067',
    projectId: 'admin-hackaton',
    storageBucket: 'admin-hackaton.appspot.com',
    iosBundleId: 'com.example.adminHackaton',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAqrpNyvYRhPIu3O-NqRXkz8M1JRS0DdJ0',
    appId: '1:190215607067:ios:1632943dbc2ac4525d39be',
    messagingSenderId: '190215607067',
    projectId: 'admin-hackaton',
    storageBucket: 'admin-hackaton.appspot.com',
    iosBundleId: 'com.example.adminHackaton.RunnerTests',
  );
}