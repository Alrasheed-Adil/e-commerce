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
    apiKey: 'AIzaSyDoRgU892FiP1DHIwm1rarGZ06zVUk_tQU',
    appId: '1:692443067215:web:ae4b8c2982cb9b48b8cb3a',
    messagingSenderId: '692443067215',
    projectId: 'e-cart-d8427',
    authDomain: 'e-cart-d8427.firebaseapp.com',
    storageBucket: 'e-cart-d8427.appspot.com',
    measurementId: 'G-FR8SRSH2TV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAP2WNUehaPIQbW5j-yyoifWKn46scjgkw',
    appId: '1:692443067215:android:ce2644ddb7d81550b8cb3a',
    messagingSenderId: '692443067215',
    projectId: 'e-cart-d8427',
    storageBucket: 'e-cart-d8427.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdTtMMhPPRgZaB_Z-A7bY2bpQpcDc9Uv4',
    appId: '1:692443067215:ios:6bca0204cde2b384b8cb3a',
    messagingSenderId: '692443067215',
    projectId: 'e-cart-d8427',
    storageBucket: 'e-cart-d8427.appspot.com',
    iosBundleId: 'com.roshdi.store',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdTtMMhPPRgZaB_Z-A7bY2bpQpcDc9Uv4',
    appId: '1:692443067215:ios:06a779d7a7ad0543b8cb3a',
    messagingSenderId: '692443067215',
    projectId: 'e-cart-d8427',
    storageBucket: 'e-cart-d8427.appspot.com',
    iosBundleId: 'com.roshdi.store.RunnerTests',
  );
}
