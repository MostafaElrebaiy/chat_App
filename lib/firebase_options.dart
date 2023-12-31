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
    apiKey: 'AIzaSyB29u4vDLgZlzFNSrjBv5O9X2-EGxSLD9A',
    appId: '1:509665004405:web:5087b04e31d9276440213c',
    messagingSenderId: '509665004405',
    projectId: 'chat-app-38e8c',
    authDomain: 'chat-app-38e8c.firebaseapp.com',
    storageBucket: 'chat-app-38e8c.appspot.com',
    measurementId: 'G-T8KP9T3SL8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAID1_77JcFPMJXIdvmlJO_qr6NBR8Muk8',
    appId: '1:509665004405:android:8ce2521010d6cf9d40213c',
    messagingSenderId: '509665004405',
    projectId: 'chat-app-38e8c',
    storageBucket: 'chat-app-38e8c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA1XHLNAqO0nbkB2WGL2HgcRiqs0OPcu_c',
    appId: '1:509665004405:ios:625775cf1d8e52f340213c',
    messagingSenderId: '509665004405',
    projectId: 'chat-app-38e8c',
    storageBucket: 'chat-app-38e8c.appspot.com',
    iosClientId: '509665004405-m2lu137paf1fdrmskndspusvcida2cdu.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA1XHLNAqO0nbkB2WGL2HgcRiqs0OPcu_c',
    appId: '1:509665004405:ios:625775cf1d8e52f340213c',
    messagingSenderId: '509665004405',
    projectId: 'chat-app-38e8c',
    storageBucket: 'chat-app-38e8c.appspot.com',
    iosClientId: '509665004405-m2lu137paf1fdrmskndspusvcida2cdu.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );
}
