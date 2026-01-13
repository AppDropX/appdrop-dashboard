import 'package:flutter/material.dart';

import '../../utilites/enums/theme_settings.dart';

class SideMenu extends StatelessWidget {
  final ThemeSection selectedSection;
  final Function(ThemeSection) onSelect;

  const SideMenu({
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
                  "Theme Settings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 4),
                Text(
                  "Customize your app appearance",
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
                  title: "App Styling",
                  isSelected: selectedSection == ThemeSection.appStyling,
                  onTap: () => onSelect(ThemeSection.appStyling),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Product Block",
                  isSelected: selectedSection == ThemeSection.productBlock,
                  onTap: () => onSelect(ThemeSection.productBlock),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Top Navigation",
                  isSelected: selectedSection == ThemeSection.topNavigation,
                  onTap: () => onSelect(ThemeSection.topNavigation),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Side Menu",
                  isSelected: selectedSection == ThemeSection.sideMenu,
                  onTap: () => onSelect(ThemeSection.sideMenu),
                ),
                SizedBox(height: 8,),
                _menuItem(
                  title: "Bottom Bar",
                  isSelected: selectedSection == ThemeSection.bottomBar,
                  onTap: () => onSelect(ThemeSection.bottomBar),
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
