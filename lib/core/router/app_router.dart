import 'package:go_router/go_router.dart';
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
);
