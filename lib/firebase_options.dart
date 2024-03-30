import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      // ... (other platforms)
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions get web {
    return FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_WEB_API_KEY']!,
      appId: dotenv.env['FIREBASE_WEB_APP_ID']!,
      messagingSenderId: dotenv.env['FIREBASE_WEB_MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['FIREBASE_WEB_PROJECT_ID']!,
      authDomain: dotenv.env['FIREBASE_WEB_AUTH_DOMAIN'],
      storageBucket: dotenv.env['FIREBASE_WEB_STORAGE_BUCKET'],
      measurementId: dotenv.env['FIREBASE_WEB_MEASUREMENT_ID'],
    );
  }

  static FirebaseOptions get android {
    return FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_ANDROID_API_KEY']!,
      appId: dotenv.env['FIREBASE_ANDROID_APP_ID']!,
      messagingSenderId: dotenv.env['FIREBASE_ANDROID_MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['FIREBASE_ANDROID_PROJECT_ID']!,
      authDomain: dotenv.env['FIREBASE_ANDROID_AUTH_DOMAIN'],
      storageBucket: dotenv.env['FIREBASE_ANDROID_STORAGE_BUCKET'],
      measurementId: dotenv.env['FIREBASE_ANDROID_MEASUREMENT_ID'],
    );
  }

  static FirebaseOptions get ios {
    return FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_IOS_API_KEY']!,
      appId: dotenv.env['FIREBASE_IOS_APP_ID']!,
      messagingSenderId: dotenv.env['FIREBASE_IOS_MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['FIREBASE_IOS_PROJECT_ID']!,
      authDomain: dotenv.env['FIREBASE_IOS_AUTH_DOMAIN'],
      storageBucket: dotenv.env['FIREBASE_IOS_STORAGE_BUCKET'],
      measurementId: dotenv.env['FIREBASE_IOS_MEASUREMENT_ID'],
    );
  }

  static FirebaseOptions get macos {
    return FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_MACOS_API_KEY']!,
      appId: dotenv.env['FIREBASE_MACOS_APP_ID']!,
      messagingSenderId: dotenv.env['FIREBASE_MACOS_MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['FIREBASE_MACOS_PROJECT_ID']!,
      authDomain: dotenv.env['FIREBASE_MACOS_AUTH_DOMAIN'],
      storageBucket: dotenv.env['FIREBASE_MACOS_STORAGE_BUCKET'],
      measurementId: dotenv.env['FIREBASE_MACOS_MEASUREMENT_ID'],
    );
  }
}
