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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfXeWug-060t_nZ9dpW0urwIRrW1cuyRE',
    appId: '1:898273018789:android:c484f3d50dd3548067de4c',
    messagingSenderId: '898273018789',
    projectId: 'gettheskydoctor',
    storageBucket: 'gettheskydoctor.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtCnLrwLosw_tf0LoqLcQSmtTjTHjoW38',
    appId: '1:898273018789:ios:db6b3c0ee444678767de4c',
    messagingSenderId: '898273018789',
    projectId: 'gettheskydoctor',
    storageBucket: 'gettheskydoctor.appspot.com',
    androidClientId: '898273018789-4q1vqsf7meissn5aae3vpj415rrdv3cc.apps.googleusercontent.com',
    iosClientId: '898273018789-5o4bld1ge18roj434kl3pdn655v0nff7.apps.googleusercontent.com',
    iosBundleId: 'com.gettheskydoctors.merchant',
  );
}
