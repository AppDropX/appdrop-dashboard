
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/router/app_router.dart';


/// Is this main Class: ignition point of App Builder


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'AppDrop',
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xffF7F8FA),
        useMaterial3: false,
      ),
      routerConfig: router,
    );
  }
}



