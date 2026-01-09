import 'package:go_router/go_router.dart';
import '../service/google_auth_service.dart';

/// Controller = business logic

class LoginController {
  final _googleAuth = GoogleAuthService();

  Future<void> loginWithGoogle(GoRouter router) async {
    final user = await _googleAuth.signInWithGoogle();

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
