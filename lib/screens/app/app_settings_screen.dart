import 'package:builder/widgets/app_settings_widgets/app_side_menu.dart';
import 'package:flutter/material.dart';

import '../../utilites/enums/app_settings.dart';


class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  AppSettings selectedSection = AppSettings.otherOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppSideMenu(
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(child: _buildSettings()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettings() {
    switch (selectedSection) {
      case AppSettings.otherOptions:
        return const Text("Other Options",style: TextStyle(fontSize: 25),);
      case AppSettings.productVariantStyling:
        return const Text("Product Variant Styling",style: TextStyle(fontSize: 25),);
      case AppSettings.loginAndAccountPage:
        return const Text("Login and Account Page",style: TextStyle(fontSize: 25),);
      case AppSettings.currencyFormat:
        return const Text("Currency Format",style: TextStyle(fontSize: 25),);
      case AppSettings.polices:
        return const Text("Policies",style: TextStyle(fontSize: 25),);
      case AppSettings.floatingActionButton:
        return const Text("Floating Action Button",style: TextStyle(fontSize: 25),);
      case AppSettings.globalCSS:
        return const Text("Global CSS",style: TextStyle(fontSize: 25),);
      case AppSettings.metaFields:
        return const Text("Metafields",style: TextStyle(fontSize: 25),);
    }
  }
}
