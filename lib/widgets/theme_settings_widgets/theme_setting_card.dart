import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SettingCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(title,
                style:
                TextStyle(fontWeight: FontWeight.w800, fontSize: 25)),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
