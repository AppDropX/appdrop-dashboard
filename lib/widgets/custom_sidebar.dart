import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final bool collapsed;
  final String selected;
  final Function(String) onSelect;

  const Sidebar({
    super.key,
    required this.collapsed,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: collapsed ? 60 : 220,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 12),

          /// WORKSPACE CARD (only when expanded)
          if (!collapsed)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children:  [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF3B82F6), // blue-500
                            Color(0xFF9333EA), // purple-600
                          ],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "JD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("My Shopping App",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,fontSize: 11)),
                          Text("Workspace",
                              style: TextStyle(
                                  fontSize: 9, color: Colors.grey,)),
                        ],
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),

            

          Expanded(
            child: ListView(

              children: [
                if(collapsed)
                  _expansionTile(
                  icon: Icons.layers_rounded,
                  title: "",
                  children: [
                  ],
                ),
                /// ================= THEME =================
                _expansionTile(
                  icon: Icons.palette_outlined,
                  title: "Theme",
                  children: [
                    _childItem("Active Theme"),
                    _childItem("Theme Settings"),
                    _childItem("Theme Library"),
                  ],
                ),

                /// ================= APP =================
                _expansionTile(
                  icon: Icons.phone_android,
                  title: "App",
                  children: [
                    _childItem("App Settings"),
                    _childItem("App Distribution"),
                    _childItem("Push Notification"),
                  ],
                ),

                /// ================= EXTENSIONS =================
                _expansionTile(
                  icon: Icons.extension,
                  title: "Extensions",
                  children: [
                    _childItem("Custom Blocks New"),
                    _childItem("Plugins"),
                    _childItem("Custom Blocks"),
                  ],
                ),

                /// ================= ACCOUNT =================
                _expansionTile(
                  icon: Icons.person_outline,
                  title: "Account",
                  children: [
                    _childItem("User Permissions"),
                    _childItem("Billing"),
                  ],
                ),
              ],
            ),
          ),

          const Divider(),
          _simpleItem(Icons.logout, "Logout"),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  /// ================= EXPANSION TILE =================
  Widget _expansionTile({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return ExpansionTile(

      expandedCrossAxisAlignment:CrossAxisAlignment.start,
      tilePadding: EdgeInsets.symmetric(
        horizontal: collapsed ? 16 : 16,
        vertical: 0, // 🔥 height control
      ),

      childrenPadding: const EdgeInsets.only(
        left: 0, // 🔥 indent control
        right: 12,
        bottom: 6,
      ),

      visualDensity: const VisualDensity(
        vertical: -3, // 🔥 makes tile compact
      ),

      leading: Icon(
        icon,
        size: 20,
        color: collapsed ? Colors.grey : Colors.black54,
      ),

      title: collapsed
          ? const SizedBox.shrink()
          : Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: collapsed
          ? const SizedBox.shrink()
          : const Icon(Icons.expand_more, size: 18,color: Colors.black54,),
      children: collapsed ? [] : children,
    );
  }

  /// ================= CHILD ITEM =================
  Widget _childItem(String title) {
    final isSelected = selected == title;
    return InkWell(
      onTap: () => onSelect(title),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.orange.shade50
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.orange
                : Colors.black87,
          ),
        ),
      ),
    );
  }
  /// ================= SIMPLE ITEM =================
  Widget _simpleItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: collapsed ? null : Text(title),
      onTap: () => onSelect(title),
    );
  }
}
