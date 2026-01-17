import 'package:builder/screens/theme/theme_library_screen.dart';
import 'package:builder/screens/theme/theme_settings_screen.dart';
import 'package:flutter/material.dart';
import '../auth/controller/login_controller.dart';
import '../widgets/custom_sidebar.dart';
import 'theme/active_theme_screen.dart';
import 'app/app_settings_screen.dart';
import 'account/billing_screen.dart';

class DashboardLayout extends StatefulWidget {
  final String name;
  final String email;
  final String photo;

  const DashboardLayout({
    super.key,
    required this.name,
    required this.email,
    required this.photo,
  });

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>{
  bool isCollapsed = false;
  String currentScreen = "Themes";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      /// TOP APP BAR
      appBar: AppBar(
        elevation: 0,
        actionsPadding: EdgeInsets.only(right: 15),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_rounded,
              color: Colors.black87,
              size: 20,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 32,
            ),
            splashRadius: 16,
          ),
          SizedBox(width: 7,),
          Container(
            width: 32,
            height: 32,
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
          )
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            setState(() => isCollapsed = !isCollapsed);
          },
        ),
        title:  Image.network("https://cdn.shopify.com/s/files/1/0734/7155/7942/files/AppDrop_Black_Logo.png?v=1766657135",fit: BoxFit.contain,height: 25,)
      ),

      body: Row(
        children: [
          /// SIDEBAR
          Sidebar(
            collapsed: isCollapsed,
            selected: currentScreen,
            onSelect: (value) {
              setState(() => currentScreen = value);
            },
            onLogout: (){
              // 🔥 actual logout logic here
              LoginController().logout(context);
            },
          ),
          /// MAIN CONTENT
          Expanded(
            child: _getScreen(),
          ),
        ],
      ),
    );
  }
  Widget _getScreen() {
    switch (currentScreen) {
      case "Themes":
        return const ThemeLibraryScreen();
      case "Active Theme":
        return const ActiveThemeScreen();
      case "Theme Settings":
        return const ThemeSettingsScreen();
      case "App Settings":
        return const AppSettingsScreen();
      case "Billing":
        return const BillingScreen();
      default:
        return Center(child: Text(currentScreen));
    }
  }

}
