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
    apiKey: 'AIzaSyDF_QqyPtYQw5DJIPJgxvWtyjVeQtvGnu8',
    appId: '1:1098448402517:web:af47c609de95ed601b7cdc',
    messagingSenderId: '1098448402517',
    projectId: 'chat-app-2d663',
    authDomain: 'chat-app-2d663.firebaseapp.com',
    storageBucket: 'chat-app-2d663.appspot.com',
    measurementId: 'G-WNRGZPS08P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsRQes7_dqo2dIDFw95d0NvE8B_KWdtpQ',
    appId: '1:1098448402517:android:f9efeceb19b555ce1b7cdc',
    messagingSenderId: '1098448402517',
    projectId: 'chat-app-2d663',
    storageBucket: 'chat-app-2d663.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5Brlh4RjpdhwDG_c5T98crxdhOInzv6g',
    appId: '1:1098448402517:ios:fdd9b3db599c79731b7cdc',
    messagingSenderId: '1098448402517',
    projectId: 'chat-app-2d663',
    storageBucket: 'chat-app-2d663.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5Brlh4RjpdhwDG_c5T98crxdhOInzv6g',
    appId: '1:1098448402517:ios:72249ab12fb36de51b7cdc',
    messagingSenderId: '1098448402517',
    projectId: 'chat-app-2d663',
    storageBucket: 'chat-app-2d663.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
