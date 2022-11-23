import 'package:chat_firebase/ui/autenticacion/login.dart';
import 'package:chat_firebase/ui/chat/salachat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat-Firebase',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        '/Login': (context) => const Login(),
        '/salachat': (context) => const Chat()
      },
    );
  }
}
