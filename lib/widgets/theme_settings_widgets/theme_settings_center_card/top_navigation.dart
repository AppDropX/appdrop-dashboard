import 'package:builder/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TopNavigationScreen extends StatefulWidget {
  const TopNavigationScreen({super.key});

  @override
  State<TopNavigationScreen> createState() => _TopNavigationScreenState();
}

class _TopNavigationScreenState extends State<TopNavigationScreen> {
  final List<String> _tabs = [
    'All Products',
    'New Arrivals',
    'Sale',
  ];

  /// Add Tab Dialog
  Future<void> _showAddTabDialog() async {
    final TextEditingController controller = TextEditingController();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Add New Tab',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter tab name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  setState(() {
                    _tabs.add(controller.text.trim());
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text(
            'Top Navigation',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Configure how products appear in your app',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Navigation Tabs',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: _showAddTabDialog,
                      icon: const Icon(Icons.add),
                      label: const Text('Add Tab'),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// Reorderable List

                ReorderableListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  buildDefaultDragHandles: false,
                  itemCount: _tabs.length,
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) newIndex--;
                      final item = _tabs.removeAt(oldIndex);
                      _tabs.insert(newIndex, item);
                    });
                  },

                  proxyDecorator: (child, index, animation) {
                    return Material(
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.30),
                      borderRadius: BorderRadius.circular(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),

                        /// ✅ SAME card, delete button INCLUDED
                        child: _TabCard(
                          text: _tabs[index],
                          index: index,
                          onDelete: () {
                            // ❗ Optional: delete disable bhi kar sakte ho
                            // setState(() => _tabs.removeAt(index));
                          },
                          isDragging: true,
                        ),
                      ),
                    );
                  },




                  itemBuilder: (context, index) {
                    return Column(
                      key: ValueKey(_tabs[index]),
                      children: [
                        _TabCard(
                          text: _tabs[index],
                          index: index,
                          onDelete: () {
                            setState(() => _tabs.removeAt(index));
                          },
                        ),
                        const SizedBox(height: 12), // ✅ spacing (normal list)
                      ],
                    );
                  },



                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _TabCard extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback? onDelete;
  final bool isDragging;

  const _TabCard({
    required this.text,
    required this.index,
    this.onDelete,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          /// Drag Handle
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

          const SizedBox(width: 12),

          Expanded(
            child: TextFormField(
              initialValue: text,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26,width: 0.5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54,width: 0.5)
                ),
              ),
              onChanged: (value) {
               // text = value;
              },
            ),
          ),

        /*  Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),*/

          if (onDelete != null)
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
        ],
      ),
    );
  }
}
