import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class Sidebar extends StatelessWidget {
  final bool collapsed;
  final String selected;
  final VoidCallback onLogout;
  final Function(String) onSelect;

  const Sidebar({
    super.key,
    required this.collapsed,
    required this.selected,
    required this.onSelect,
    required this.onLogout
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
                  context: context,
                  icon: Icons.layers_rounded,
                  title: "",
                  children: [
                  ],
                ),
                /// ================= THEME =================
                _expansionTile(
                  context: context,
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
                  context: context,
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
                  context: context,
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
                  context: context,
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

          const Divider(thickness: 0.5,color: Colors.black12,),
          ListTile(
            minVerticalPadding: 0,
            minTileHeight: 30,
            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
            leading: const Icon(Icons.logout,size: 20,),
            title: collapsed ? null : const Text("Logout"),
            onTap: () {
              showLogoutDialog(
                context,
                onLogout, // 🔥 function call
              );
            },
          ),

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
    required BuildContext context
  }) {
    return ListTileTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
      horizontalTitleGap: 6, // space between leading and title
      minLeadingWidth: 25,

      minVerticalPadding: 0,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent
        ),
        child: ExpansionTile(
          //minTileHeight: 35,

          initiallyExpanded: true,
          expandedCrossAxisAlignment:CrossAxisAlignment.start,
          tilePadding: EdgeInsets.symmetric(
            horizontal: collapsed ? 16 : 16,
            vertical: 0, // 🔥 height control
          ),
        
          childrenPadding: const EdgeInsets.only(
            left: 11, // 🔥 indent control
            right: 15,
            bottom: 0,
            top: 0
          ),
        
          visualDensity: const VisualDensity(
            vertical: -3, // 🔥 makes tile compact
          ),
        
          leading: Icon(
            icon,
            size: 20,
            color: collapsed ? Colors.grey : Color(0xffF76B0A),
          ),
          title: collapsed
              ? const SizedBox.shrink()
              : Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: collapsed
              ? const SizedBox.shrink()
              : const Icon(Icons.expand_more, size: 15,color: Colors.black54,),
          children: collapsed ? [] : children,
        ),
      ),
    );
  }
  /// ================= CHILD ITEM =================
  Widget _childItem(String title) {
    final isSelected = selected == title;
    return InkWell(
      onTap: () => onSelect(title),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xffF76B0A)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.black87,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }

  Future<void> showLogoutDialog(
      BuildContext context,
      VoidCallback onLogout,
      ) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 0),
          titlePadding: EdgeInsets.symmetric(horizontal: 15,vertical: 11),
          actionsPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            "Logout",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          content: const Text(
            "Are you sure you want to logout?",
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel",style: TextStyle(color: Colors.black87),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context); // close dialog
                onLogout(); // 🔥 actual logout call
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

}
