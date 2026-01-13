import 'package:web/web.dart' as web;

class LocalStorageService {
  static const _tokenKey = 'auth_token';

  static void saveToken(String token) {
    web.window.localStorage.setItem(_tokenKey, token);
  }

  static String? get token =>
      web.window.localStorage.getItem(_tokenKey);

  static bool get isLoggedIn => token != null;

  static void clear() {
    web.window.localStorage.removeItem(_tokenKey);
  }
}
