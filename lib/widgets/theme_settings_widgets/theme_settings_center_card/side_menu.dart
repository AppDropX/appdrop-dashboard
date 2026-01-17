import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  final List<String> menuItems = [
    'Home',
    'Collections',
    'About Us',
    'Contact',
  ];

  bool showDividers = true;

  /// Add Item Dialog
  Future<void> _showAddItemDialog() async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Menu Item"),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Enter tab name",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  setState(() {
                    menuItems.add(controller.text.trim());
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text(
            "Side Menu",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          const Text(
            "Configure the hamburger menu navigation",
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const SizedBox(height: 20),
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
                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Menu Items",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    ElevatedButton.icon(
                      onPressed: _showAddItemDialog,
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text("Add Item"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                /// Reorderable List
                ReorderableListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  buildDefaultDragHandles: false,
                  itemCount: menuItems.length,
                  onReorder: (oldIndex, newIndex) {
                    if (newIndex > oldIndex) newIndex--;
                    setState(() {
                      final item = menuItems.removeAt(oldIndex);
                      menuItems.insert(newIndex, item);
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      key: ValueKey(menuItems[index]),
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          /// Drag handle ONLY
                          MouseRegion(
                            cursor: SystemMouseCursors.grab,
                            child: ReorderableDragStartListener(
                              index: index,
                              child: const Icon(
                                Icons.drag_indicator,
                                color: Colors.grey,
                              ),
                            ),
                          ),


                          const SizedBox(width: 10),

                          /// Text field
                          Expanded(
                            child: TextFormField(
                              initialValue: menuItems[index],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                menuItems[index] = value;
                              },
                            ),
                          ),

                          /// Delete button
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                menuItems.removeAt(index);
                              });
                            },
                          ),
                        ],
                      )

                    );
                  },
                ),

                const SizedBox(height: 16),

                /// Divider Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Show Dividers",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    CupertinoSwitch(
                      value: showDividers,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        setState(() => showDividers = value);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// Sync Button
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.link),
                  label: const Text("Sync from Shopify"),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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
}
