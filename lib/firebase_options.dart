import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyDNB_dc6L0B_z6VN9rHoVZF0wyUPrigKHc',
  //   appId: '1:628904566821:web:0305b6622b4c257980dfcc',
  //   messagingSenderId: '628904566821',
  //   projectId: 'demoapp-83d7f',
  //   authDomain: 'demoapp-83d7f.firebaseapp.com',
  //   storageBucket: 'demoapp-83d7f.appspot.com',
  // );

  // static const FirebaseOptions android = FirebaseOptions(
  //   apiKey: 'AIzaSyDQ_pxBBd5K4UAQJYZsAnxpgyeltnJ7enQ',
  //   appId: '1:628904566821:android:b94e2dbc3a540fb280dfcc',
  //   messagingSenderId: '628904566821',
  //   projectId: 'demoapp-83d7f',
  //   storageBucket: 'demoapp-83d7f.appspot.com',
  // );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyA345YDc_Znf5wLX__6mQD6D90VO5WubIY',
  //   appId: '1:628904566821:ios:762170326996310680dfcc',
  //   messagingSenderId: '628904566821',
  //   projectId: 'demoapp-83d7f',
  //   storageBucket: 'demoapp-83d7f.appspot.com',
  //   iosBundleId: 'com.example.demoApp',
  // );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyA345YDc_Znf5wLX__6mQD6D90VO5WubIY',
  //   appId: '1:628904566821:ios:970bb2bda543827680dfcc',
  //   messagingSenderId: '628904566821',
  //   projectId: 'demoapp-83d7f',
  //   storageBucket: 'demoapp-83d7f.appspot.com',
  //   iosBundleId: 'com.example.demoApp.RunnerTests',
  // );
}
