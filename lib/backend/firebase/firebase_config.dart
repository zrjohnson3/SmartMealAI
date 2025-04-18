import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDsmWwXM7Mur9pvFYjF1lN25zZBLJ2Wp6c",
            authDomain: "smartmealai-f7fdb.firebaseapp.com",
            projectId: "smartmealai-f7fdb",
            storageBucket: "smartmealai-f7fdb.firebasestorage.app",
            messagingSenderId: "265487456600",
            appId: "1:265487456600:web:599098899d69d6d8816d2d",
            measurementId: "G-DJFZJGZ9ZZ"));
  } else {
    await Firebase.initializeApp();
  }
}
