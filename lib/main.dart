
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login/login_page.dart';

void main() async{

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBsVLcVDjuUY3s2269cIfdje9ZI11laj3A",
      authDomain: "appdrop-ee3c4.firebaseapp.com",
      projectId: "appdrop-ee3c4",
      appId: "1:179539359710:web:97604f7f53bb27611e0f4f",
      messagingSenderId: "179539359710",
    ),
  );


  runApp(const AppDropApp());
}

class AppDropApp extends StatelessWidget {
  const AppDropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppDrop',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF7F8FA),
        useMaterial3: false,
        fontFamily: 'Inter',
      ),
      home:LoginPage(),
    );
  }
}


