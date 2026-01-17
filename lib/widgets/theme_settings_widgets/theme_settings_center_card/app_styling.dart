import 'package:builder/core/constants/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../bloc/builder_bloc/theme_settings_bloc/theme_settings_bloc.dart';
import '../../../bloc/builder_bloc/theme_settings_bloc/theme_settings_event.dart';
import '../../../bloc/builder_bloc/theme_settings_bloc/theme_settings_state.dart';

class AppStylingScreen extends StatefulWidget {
  const AppStylingScreen({super.key});

  @override  State<AppStylingScreen> createState() => _AppStylingScreenState();
}

class _AppStylingScreenState extends State<AppStylingScreen> {


  @override
  void initState() {
    super.initState();

  }

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
      body: BlocBuilder<ThemeSettingsBloc, ThemeSettingsState>(
          builder: (context, state) {
            if(state is ThemeSettingsErrorState){
              print(state.errorMsg);
              return Text(state.errorMsg);
            }
            if (state is ThemeSettingsLoadedState) {
              var appStyling = state.themeSettingsData.themeSettings[0].appStyling!;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'App Styling',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Configure colors, typography, and navigation styles',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    const SizedBox(height: 24),
                    _buildCard(
                      title: 'Typography',
                      child: _buildDropdown(
                        label: 'Font Family',
                        value: _selectedFont,
                        items: appStyling.fontFamily,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedFont = value;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildCard(
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
                    ),
                    const SizedBox(height: 24),
                    _buildCard(
                      title: 'Bottom Bar',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDropdown(
                            label: appStyling.bottomBarStyle.toString(),
                            value: _bottomBarSelectionStyle,
                            items: appStyling.styleItems,
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
                            items: appStyling.iconStyle,
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
                    )
                  ],
                ),
              );
            }
            return Container();
          }),
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
    required String label, required String value, required List<String> items, required ValueChanged<String?> onChanged,
}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: const TextStyle(fontWeight: FontWeight.w500),),
        const SizedBox(height: 8),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            menuItemStyleData: MenuItemStyleData(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            isExpanded: true,
            hint: Text(
              label,
              style: TextStyle(fontSize: 17,color: Colors.black,),
            ),
            value: value,
            items: items.map((item){
              return DropdownMenuItem(
                value: item,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              width: double.infinity,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              //maxHeight: 200,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(color: Colors.black54,width: 0.5),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey.shade400,
                size: 20,
              ),
              openMenuIcon: Icon(
                Icons.arrow_drop_up,
                color: Colors.grey.shade400,
                size: 20,
              ),
            ),
          ),
        )
      ]
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
            height: 280, // 🔥 FIXED HEIGHT (NO EXTRA SPACE)
            child: ColorPicker(
              pickerColor: initialColor,
              onColorChanged: onColorChanged,
              colorPickerWidth: 300,
              pickerAreaHeightPercent: 0.35,
              enableAlpha: true,
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
