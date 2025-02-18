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
    apiKey: 'AIzaSyCL1LDnl4HSBMo3uBcgYkEOb9ye_nZzAuQ',
    appId: '1:66536335679:web:4be5178bcf4252998d0b8a',
    messagingSenderId: '66536335679',
    projectId: 'grocery-application-e3c19',
    authDomain: 'grocery-application-e3c19.firebaseapp.com',
    storageBucket: 'grocery-application-e3c19.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCi8S_2sOLbTX3OjOIw6L-_mjwwXAzebnQ',
    appId: '1:66536335679:android:fa0cd4acde96f7868d0b8a',
    messagingSenderId: '66536335679',
    projectId: 'grocery-application-e3c19',
    storageBucket: 'grocery-application-e3c19.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiczG-JwyMqJ2EDLEYZgMybIIFS_wcais',
    appId: '1:66536335679:ios:cdb915740fd30c0d8d0b8a',
    messagingSenderId: '66536335679',
    projectId: 'grocery-application-e3c19',
    storageBucket: 'grocery-application-e3c19.firebasestorage.app',
    iosBundleId: 'com.example.groceryApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiczG-JwyMqJ2EDLEYZgMybIIFS_wcais',
    appId: '1:66536335679:ios:cdb915740fd30c0d8d0b8a',
    messagingSenderId: '66536335679',
    projectId: 'grocery-application-e3c19',
    storageBucket: 'grocery-application-e3c19.firebasestorage.app',
    iosBundleId: 'com.example.groceryApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCL1LDnl4HSBMo3uBcgYkEOb9ye_nZzAuQ',
    appId: '1:66536335679:web:c2995c4937ba01198d0b8a',
    messagingSenderId: '66536335679',
    projectId: 'grocery-application-e3c19',
    authDomain: 'grocery-application-e3c19.firebaseapp.com',
    storageBucket: 'grocery-application-e3c19.firebasestorage.app',
  );
}
