import 'package:builder/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppStylingScreen extends StatefulWidget {
  const AppStylingScreen({super.key});

  @override  State<AppStylingScreen> createState() => _AppStylingScreenState();
}

class _AppStylingScreenState extends State<AppStylingScreen> {
  // State variables for Typography
  String _selectedFont = 'Inter';
  final List<String> _fontFamilies = ['Inter', 'Roboto', 'Lato', 'Open Sans'];

  // State variables for Toolbar
  Color _toolbarBackgroundColor = Colors.white;
  Color _toolbarFontColor = Colors.black;

  // State variables for Bottom Bar
  String _bottomBarSelectionStyle = 'Underline';
  final List<String> _selectionStyles = ['Underline', 'Highlight', 'None'];
  String _bottomBarIconStyle = 'With Labels';
  final List<String> _iconStyles = ['With Labels', 'Icon Only'];
  Color _bottomBarBackgroundColor = Colors.white;
  Color _bottomBarSelectedColor = const Color(0xFFF76B0A);
  Color _bottomBarUnselectedColor = const Color(0xFF9CA3AF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // A light grey background for the body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'App Styling',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Configure colors, typography, and navigation styles',
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            _buildTypographyCard(),
            const SizedBox(height: 24),
            _buildToolbarCard(),
            const SizedBox(height: 24),
            _buildBottomBarCard(),
          ],
        ),
      ),
    );
  }
  Widget _buildTypographyCard() {
    return _buildCard(
      title: 'Typography',
      child: _buildDropdown(
        label: 'Font Family',
        value: _selectedFont,
        items: _fontFamilies,
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedFont = value;
            });
          }
        },
      ),
    );
  }

  Widget _buildToolbarCard() {
    return _buildCard(
      title: 'Toolbar',
      child: Column(children: [
        _buildColorPicker(
          label: 'Background Color',
          color: _toolbarBackgroundColor,
          onColorChanged: (color) {
            setState(() {
              _toolbarBackgroundColor = color;
            });
          },
        ),
        const SizedBox(height: 16),
        _buildColorPicker(
          label: 'Font & Icon Color',
          color: _toolbarFontColor,
          onColorChanged: (color) {
            setState(() {
              _toolbarFontColor = color;
            });
          },
        ),
      ],
      ),
    );
  }

  Widget _buildBottomBarCard() {
    return _buildCard(
      title: 'Bottom Bar',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDropdown(
            label: 'Selection Style',
            value: _bottomBarSelectionStyle,
            items: _selectionStyles,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _bottomBarSelectionStyle = value;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          _buildDropdown(
            label: 'Icon Style',
            value: _bottomBarIconStyle,
            items: _iconStyles,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _bottomBarIconStyle = value;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          _buildColorPicker(
            label: 'Background Color',
            color: _bottomBarBackgroundColor,
            onColorChanged: (color) =>
                setState(() => _bottomBarBackgroundColor = color),
          ),
          const SizedBox(height: 16),
          _buildColorPicker(
            label: 'Selected Font & Icon Color',
            color: _bottomBarSelectedColor,
            onColorChanged: (color) =>
                setState(() => _bottomBarSelectedColor = color),
          ),
          const SizedBox(height: 16),
          _buildColorPicker(
            label: 'Unselected Font & Icon Color',
            color: _bottomBarUnselectedColor,
            onColorChanged: (color) =>
                setState(() => _bottomBarUnselectedColor = color),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width:0.5,color: AppColors.lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }


  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildColorPicker({
    required String label,
    required Color color,
    required ValueChanged<Color> onColorChanged,
  }) {// Helper to convert Color to Hex string
    String toHexString(Color color) {
      return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _showColorPickerDialog(color, onColorChanged),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(width: 10),
                Text(toHexString(color)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Method to show the color picker dialog
  void _showColorPickerDialog(
      Color initialColor,
      ValueChanged<Color> onColorChanged,
      ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black26,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: SizedBox(
            width: 250,
            height: 250, // 🔥 FIXED HEIGHT (NO EXTRA SPACE)
            child: ColorPicker(
              pickerColor: initialColor,
              onColorChanged: onColorChanged,
              colorPickerWidth: 300,
              pickerAreaHeightPercent: 0.35,
              enableAlpha: false,
              portraitOnly: true,
              displayThumbColor: true,
              labelTypes: const [
                ColorLabelType.rgb, // R G B boxes
                ColorLabelType.hsl, // H S L boxes
                ColorLabelType.hsv, // H S V boxes
                ColorLabelType.hex, // Hex boxes
              ],
            ),
          ),
        );
      },
    );
  }



}
