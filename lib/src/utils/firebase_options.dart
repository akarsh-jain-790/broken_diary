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
    apiKey: 'AIzaSyD4T7iL3PtqUAzLRuoj6TOray_B8ym9uk4',
    appId: '1:724448664603:web:7afd819fb3af364691acbe',
    messagingSenderId: '724448664603',
    projectId: 'cine-buddy',
    authDomain: 'cine-buddy.firebaseapp.com',
    storageBucket: 'cine-buddy.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfkfv9P5p7FCMO_sY0NmyAJN1vCF03qTs',
    appId: '1:724448664603:android:036173e9689f84a491acbe',
    messagingSenderId: '724448664603',
    projectId: 'cine-buddy',
    storageBucket: 'cine-buddy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARKFKxFc28CxPH0FQ7Yc3Lu2QURiustlY',
    appId: '1:724448664603:ios:b067da951658379891acbe',
    messagingSenderId: '724448664603',
    projectId: 'cine-buddy',
    storageBucket: 'cine-buddy.appspot.com',
    iosBundleId: 'com.cinebuddy.cineBuddy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARKFKxFc28CxPH0FQ7Yc3Lu2QURiustlY',
    appId: '1:724448664603:ios:1f7ad879b5c3c2e991acbe',
    messagingSenderId: '724448664603',
    projectId: 'cine-buddy',
    storageBucket: 'cine-buddy.appspot.com',
    iosBundleId: 'com.cinebuddy.cineBuddy.RunnerTests',
  );
}
