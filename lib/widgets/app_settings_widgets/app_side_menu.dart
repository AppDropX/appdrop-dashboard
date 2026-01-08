import 'package:builder/core/enums/app_settings.dart';
import 'package:flutter/material.dart';



class AppSideMenu extends StatelessWidget {
  final AppSettings selectedSection;
  final Function(AppSettings) onSelect;

  const AppSideMenu({
    super.key,
    required this.selectedSection,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "App Settings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4),
                Text(
                  "Configure your app preferences",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          const Divider(),

          Padding(
            padding: const EdgeInsets.all(11),
            child: Column(
              children: [
                _menuItem(
                  title: "Other Options",
                  isSelected: selectedSection ==AppSettings.otherOptions,
                  onTap: () => onSelect(AppSettings.otherOptions),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Product Variant Styling",
                  isSelected: selectedSection == AppSettings.productVariantStyling,
                  onTap: () => onSelect(AppSettings.productVariantStyling),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Login and Account Page",
                  isSelected: selectedSection == AppSettings.loginAndAccountPage,
                  onTap: () => onSelect(AppSettings.loginAndAccountPage),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Currency Format",
                  isSelected: selectedSection == AppSettings.currencyFormat,
                  onTap: () => onSelect(AppSettings.currencyFormat),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Policies",
                  isSelected: selectedSection == AppSettings.polices,
                  onTap: () => onSelect(AppSettings.polices),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Floating Action Button",
                  isSelected: selectedSection == AppSettings.floatingActionButton,
                  onTap: () => onSelect(AppSettings.floatingActionButton),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Global CSS",
                  isSelected: selectedSection == AppSettings.globalCSS,
                  onTap: () => onSelect(AppSettings.globalCSS),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Metafields",
                  isSelected: selectedSection == AppSettings.metaFields,
                  onTap: () => onSelect(AppSettings.metaFields),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        //margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x1ff76b0a) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: isSelected ? const Color(0xffF76B0A) : Colors.black,
                  fontSize: 13,fontWeight: FontWeight.w500
              ),
            ),
            if (isSelected)
              const Icon(Icons.chevron_right, color: Color(0xffF76B0A),size: 16,),
          ],
        ),
      ),
    );
  }
}
