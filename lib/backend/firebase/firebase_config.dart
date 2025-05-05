import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA-33a4LVe0cPTEF9kiAJAEIPeB_LM9pa0",
            authDomain: "smart-meal-a-i-1gu04c.firebaseapp.com",
            projectId: "smart-meal-a-i-1gu04c",
            storageBucket: "smart-meal-a-i-1gu04c.firebasestorage.app",
            messagingSenderId: "116169147208",
            appId: "1:116169147208:web:72583151e2b2a5b91d297d"));
  } else {
    await Firebase.initializeApp();
  }
}
