import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, c) {
        if (c.maxWidth < 1100) {
          return const Center(child: Text("Please resize window"));
        }
        return child;
      },
    );
  }
}
