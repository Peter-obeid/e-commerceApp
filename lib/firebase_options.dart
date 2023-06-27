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
    apiKey: 'AIzaSyCjyvNGA2sIk_OjEBoTv3dBOUvXylnIfyw',
    appId: '1:451744741397:web:5e3516e013b4cb448f761c',
    messagingSenderId: '451744741397',
    projectId: 'ecommerce-c9698',
    authDomain: 'ecommerce-c9698.firebaseapp.com',
    storageBucket: 'ecommerce-c9698.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHD853raeIqtJrFm9T-pi_vnNSrRGhrbs',
    appId: '1:451744741397:android:21002bdf9f58d5c28f761c',
    messagingSenderId: '451744741397',
    projectId: 'ecommerce-c9698',
    storageBucket: 'ecommerce-c9698.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwmrX2iUTo4UX0r5mJxVBKgtq_9VN4yDo',
    appId: '1:451744741397:ios:4ab0f98114a671288f761c',
    messagingSenderId: '451744741397',
    projectId: 'ecommerce-c9698',
    storageBucket: 'ecommerce-c9698.appspot.com',
    iosClientId: '451744741397-sdl27r4hp6vk76csp16j4hg97mh0q354.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwmrX2iUTo4UX0r5mJxVBKgtq_9VN4yDo',
    appId: '1:451744741397:ios:4ab0f98114a671288f761c',
    messagingSenderId: '451744741397',
    projectId: 'ecommerce-c9698',
    storageBucket: 'ecommerce-c9698.appspot.com',
    iosClientId: '451744741397-sdl27r4hp6vk76csp16j4hg97mh0q354.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceapp',
  );
}