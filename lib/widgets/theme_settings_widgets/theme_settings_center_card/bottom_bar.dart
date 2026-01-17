import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() =>
      _BottomBarScreenState();
}

class _BottomBarScreenState
    extends State<BottomBarScreen> {
  bool bottomNavEnabled = true;

  final List<_NavItem> navItems = [
    _NavItem(Icons.home, "Home", true),
    _NavItem(Icons.grid_view, "Collections", true),
    _NavItem(Icons.favorite_border, "Wishlist", true),
    _NavItem(Icons.shopping_cart_outlined, "Cart", true),
    _NavItem(Icons.person_outline, "Account", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [

          const Text(
            "Bottom Navigation",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          const Text(
            "Configure bottom navigation bar",
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width:0.5,color: AppColors.lightBorder),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Main switch
                _switchTile(
                  title: "Bottom Navigation Bar",
                  value: bottomNavEnabled,
                  onChanged: (val) {
                    setState(() => bottomNavEnabled = val);
                  },
                ),

                const SizedBox(height: 12),

                /// Info box
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF5FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.info_outline, color: Colors.blue, size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Bottom navigation requires minimum 4 and maximum 5 elements",
                          style: TextStyle(fontSize: 13, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// Navigation items
                ...navItems.map((item) {
                  return _switchTile(
                    leading: Icon(item.icon, size: 20),
                    title: item.title,
                    value: item.enabled,
                    onChanged: (val) {
                      setState(() => item.enabled = val);
                    },
                  );
                }),

                const SizedBox(height: 8),

                /// Add new button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: const Text(
                      "+  Add New (Max 5 items)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable iOS switch tile
  Widget _switchTile({
    Widget? leading,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          if (leading != null) ...[
            leading,
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Transform.scale(
            scale: 0.65,
            child: CupertinoSwitch(
              value: value,
              activeColor: AppColors.primary,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

/// Model
class _NavItem {
  final IconData icon;
  final String title;
  bool enabled;

  _NavItem(this.icon, this.title, this.enabled);
}
