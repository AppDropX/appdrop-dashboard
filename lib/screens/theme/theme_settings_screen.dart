import 'package:builder/widgets/theme_settings_widgets/theme_settings_center_card/app_styling.dart';
import 'package:flutter/material.dart';

import '../../utilites/enums/theme_settings.dart';
import '../../widgets/theme_settings_widgets/theme_mobile_preview.dart';
import '../../widgets/theme_settings_widgets/theme_side_menu.dart';

class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({super.key});

  @override
  State<ThemeSettingsScreen> createState() => _ThemeSettingsScreenState();
}

class _ThemeSettingsScreenState extends State<ThemeSettingsScreen> {
  ThemeSection selectedSection = ThemeSection.appStyling;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            selectedSection: selectedSection,
            onSelect: (section) {
              setState(() {
                selectedSection = section;
              });
            },
          ),

          /// Center Settings
          Expanded(
            flex: 30,
            child: Center(child: _buildSettings()),
          ),

          /// Right Preview
          Expanded(
            flex: 15,
            child: Container(
                color: Colors.black12,
                child: MobilePreview(section: selectedSection)),
          ),
        ],
      ),
    );
  }

  Widget _buildSettings() {
    switch (selectedSection) {
      case ThemeSection.appStyling:
        return const AppStylingScreen();
      case ThemeSection.productBlock:
        return const Text("Product Block Settings",style: TextStyle(fontSize: 25),);
      case ThemeSection.topNavigation:
        return const Text("Top Navigation Settings",style: TextStyle(fontSize: 25),);
      case ThemeSection.sideMenu:
        return const Text("Side Menu Settings",style: TextStyle(fontSize: 25),);
      case ThemeSection.bottomBar:
        return const Text("Bottom Bar Settings",style: TextStyle(fontSize: 25),);
    }
  }
}
