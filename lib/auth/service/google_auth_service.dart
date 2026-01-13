import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Handles only Google authentication
/// No UI, no navigation here
class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithGoogle() async {
    try {
      final provider = GoogleAuthProvider()
        ..addScope('email')
        ..setCustomParameters({'prompt': 'select_account'});

      final credential = await _auth.signInWithPopup(provider);
      return credential.user;
    } catch (e) {
      debugPrint("Google Sign-In Error: $e");
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
