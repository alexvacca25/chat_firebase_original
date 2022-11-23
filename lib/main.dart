import 'package:chat_firebase/domain/controller/controluser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPlatform.isWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyD0-Q5YNxcT35UteRJDFExnMFb4_sURiHM",
              authDomain: "chatfirebase-5f7e8.firebaseapp.com",
              projectId: "chatfirebase-5f7e8",
              storageBucket: "chatfirebase-5f7e8.appspot.com",
              messagingSenderId: "875066611600",
              appId: "1:875066611600:web:e506dc6b98486a69f10515"))
      : await Firebase.initializeApp();

  Get.put(ControlAuthFirebase());
  runApp(const App());
}
