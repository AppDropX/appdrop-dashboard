/*import 'package:go_router/go_router.dart';
import '../../login_features/auth/view/login_page.dart';
import '../../screens/home_screen.dart';
import '../layout/app_shell.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginPage(),
    ),
    ShellRoute(
      builder: (_, __, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (_, __) => const DashboardLayout(name: "", email: "", photo: ""),
        ),
      ],
    ),
  ],
);*/

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../auth/view/login_page.dart';
import '../../screens/home_screen.dart';
import '../layout/app_shell.dart';
import '../storage/local_storage_service.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/login',

  redirect: (BuildContext context, GoRouterState state) {
    final bool isLoggedIn = LocalStorageService.isLoggedIn;
    final bool goingToLogin = state.uri.path == '/login';

    // ❌ Not logged in → block home
    if (!isLoggedIn && !goingToLogin) {
      return '/login';
    }

    // ✅ Logged in → block login page
    if (isLoggedIn && goingToLogin) {
      return '/home';
    }

    return null; // allow navigation
  },

  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    ShellRoute(
      builder: (_, __, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (_, __) => const DashboardLayout(name: "", email: "", photo: ""),
        ),
      ],
    ),
  ],
);
