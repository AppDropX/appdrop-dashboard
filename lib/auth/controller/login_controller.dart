/*
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../service/google_auth_service.dart';

/// Controller = business logic

class LoginController {
  final _googleAuth = GoogleAuthService();

  Future<void> loginWithGoogle(GoRouter router) async {
    final user = await _googleAuth.signInWithGoogle();

    final String? idToken = await user?.getIdToken();
    debugPrint("Response: ${idToken}");
    if (user != null) {
      // future: save user / token here
      router.go('/home');
    }
  }

  void continueWithEmail(GoRouter router) {
    // future: Email API Login is here.
    router.go('/home');
  }
}
*/


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/storage/local_storage_service.dart';
import '../service/google_auth_service.dart';

/// Controller = business logic
class LoginController {
  final _googleAuth = GoogleAuthService();

  Future<void> loginWithGoogle(GoRouter router) async {
    final user = await _googleAuth.signInWithGoogle();

    final String? idToken = await user?.getIdToken();

    if (idToken != null) {
      LocalStorageService.saveToken(idToken);
      debugPrint("Token Saved");
      router.go('/home');
    }
  }

  void continueWithEmail(GoRouter router) {
    LocalStorageService.saveToken("jkggjhgjhgjhgjhgjhg");
    // TODO: Email OTP login API
    // On success -> save token same way
    router.go('/home');
  }

  Future<void> logout(BuildContext context) async {
    // 1️⃣ Firebase / Google logout
    await FirebaseAuth.instance.signOut();

    // 2️⃣ Local storage clear
    LocalStorageService.clear();

    // 3️⃣ Redirect to login
    context.go('/login');
  }

}
