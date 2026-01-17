import 'package:builder/bloc/builder_bloc/theme_settings_bloc/theme_settings_event.dart';
import 'package:builder/utilites/repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/builder_bloc/theme_settings_bloc/theme_settings_bloc.dart';
import 'config/app_config.dart';
import 'core/router/app_router.dart';

/// Is this main Class: ignition point of App Builder

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: AppConfig.firebaseApiKey,
      authDomain: AppConfig.firebaseAuthDomain,
      projectId: AppConfig.firebaseProjectID,
      appId: AppConfig.firebaseAppID,
      messagingSenderId: AppConfig.firebaseMessagingSenderID,
    ),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeSettingsBloc(BuilderRepository())..add(GetThemeSettingEvent()),),
        //BlocProvider(create: (context) => themeSettingsPreviewBloc),
      ],
      child: const AppDropApp(),
    ),
  );
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
      routerConfig: appRouter,
    );
  }
}
