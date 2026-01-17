import 'package:builder/core/constants/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../bloc/builder_bloc/theme_settings_bloc/theme_settings_bloc.dart';
import '../../../bloc/builder_bloc/theme_settings_bloc/theme_settings_state.dart';

class ProductBlockScreen extends StatefulWidget {
  const ProductBlockScreen({super.key});

  @override
  State<ProductBlockScreen> createState() => _ProductBlockScreenState();
}

class _ProductBlockScreenState extends State<ProductBlockScreen> {
  // Switches
  bool showSellingPrice = true;
  bool showRetailPrice = true;
  bool showStrikeThrough = true;
  bool showDiscount = true;
  bool showRating = true;
  bool showRatingCount = true;
  bool showVendor = true;
  bool showSwatches = true;

  // Dropdown values
  String priceFont = "Bold";
  String discountSize = "Small";

  // Sliders
  double cornerRadius = 12;
  double maxLines = 2;
  double cardPadding = 12;

  // Colors
  Color imageBgColor = Colors.grey.shade300;
  Color priceColor = Colors.black;
  Color discountColor = Colors.red;
  Color ratingColor = Colors.orange;
  Color titleColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeSettingsBloc, ThemeSettingsState>(
          builder: (context, state) {
            if(state is ThemeSettingsErrorState){
              print(state.errorMsg);
              return Text(state.errorMsg);
            }
            if (state is ThemeSettingsLoadedState) {
              var productBlock = state.themeSettingsData.themeSettings[1].productBlock!;

              return ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  const Text(
                    'Product Block',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Configure how products appear in your app',
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                  const SizedBox(height: 24),
                  _card([
                    _sectionTitle("Image Settings"),
                    _label("Image Aspect Ratio"),
                    _segmented(
                      items: productBlock.imageAspectRatio,
                      onChanged: (index) {
                        debugPrint("Selected index: $index");
                      },
                    ),
                    SizedBox(height: 11,),
                    _label("Image Position"),
                    _segmented(
                      items: productBlock.imagePosition,
                      onChanged: (index) {
                        debugPrint("Selected index: $index");
                      },
                    ),
                    SizedBox(height: 11,),
                    _slider("Corner Radius (px)", cornerRadius, 0, 40,
                            (v) => setState(() => cornerRadius = v)),
                    _colorPicker("Image Background Color", imageBgColor,
                            (c) => setState(() => imageBgColor = c)),
                  ]),

                  const SizedBox(height: 24),

                  _card([
                    _sectionTitle("Price Settings"),

                    _switch("Show Selling Price", showSellingPrice,
                            (v) => setState(() => showSellingPrice = v)),
                    _dropdown(label: "Font Variation", value: priceFont,items: productBlock.sellingPriceFontStyle,
                           onChanged: (v) => setState(() => priceFont = v),title: "Color",color: priceColor,
                           colorOnChanged: (c) => setState(() => priceColor = c)),
                    _switch("Show Retail Price", showRetailPrice,
                            (v) => setState(() => showRetailPrice = v)),
                    _switch("Show Strikethrough", showStrikeThrough,
                            (v) => setState(() => showStrikeThrough = v)),
                    _switch("Show Discount Value", showDiscount,
                            (v) => setState(() => showDiscount = v)),
                    _dropdown(label: "Discount Size", value: discountSize,items:  productBlock.discountValueSize,
                           onChanged: (v) => setState(() => discountSize = v),title: "Color",color: discountColor,
                           colorOnChanged: (c) => setState(() => discountColor = c)),
                    _colorPicker("Discount Color", discountColor,
                            (c) => setState(() => discountColor = c)),
                  ]),

                  const SizedBox(height: 24),

                  _card([
                    _sectionTitle("Ratings & Reviews"),
                    _switch("Show Product Rating", showRating,
                            (v) => setState(() => showRating = v)),
                    _colorPicker("Rating Icon Color", ratingColor,
                            (c) => setState(() => ratingColor = c)),
                    _switch("Show Rating Count", showRatingCount,
                            (v) => setState(() => showRatingCount = v)),
                  ]),

                  const SizedBox(height: 24),

                  _card([
                    _sectionTitle("Card Title"),
                    _label("Text Behavior"),
                    _segmented(
                      items: productBlock.titleTextBehavior,
                      onChanged: (index) {
                        debugPrint("Selected index: $index");
                      },
                    ),
                    SizedBox(height: 11,),
                    _slider("Max Lines", maxLines, 1, 4,
                            (v) => setState(() => maxLines = v)),
                    _label("Alignment"),
                    _segmented(
                      items: productBlock.titleTextAlignment,
                      onChanged: (index) {
                        debugPrint("Selected index: $index");
                      },
                    ),
                    SizedBox(height: 11,),
                    _colorPicker("Title Color", titleColor,
                            (c) => setState(() => titleColor = c)),
                  ]),

                  const SizedBox(height: 24),

                  _card([
                    _sectionTitle("Additional Settings"),
                    _switch("Show Vendor", showVendor,
                            (v) => setState(() => showVendor = v)),
                    _switch("Show Swatches", showSwatches,
                            (v) => setState(() => showSwatches = v)),
                    _slider("Card Padding (px)", cardPadding, 0, 24,
                            (v) => setState(() => cardPadding = v)),
                  ]),
                ],
              );
            }
            return Container();
          }),



    );
  }

  // -------------------- UI HELPERS --------------------

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top:8,bottom: 8 ),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }

  Widget _card(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width:0.5,color: AppColors.lightBorder),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children),
    );
  }

/*  Widget _switch(String title, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      value: value,
      activeColor: Colors.orange,
      onChanged: onChanged,
    );
  }*/

  Widget _switch(String title, bool value, ValueChanged<bool> onChanged) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Transform.scale(
          scale: 0.6,
          child: CupertinoSwitch(
            value: value,
            activeColor:  AppColors.primary, // orange like your UI
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }


  Widget _dropdown({
    required String label,
    required String title,
    required Color color,
    required ValueChanged<Color> colorOnChanged,
    required String value,
    required List<String> items,
    required ValueChanged<String> onChanged,
  }) {
    return Row(
      children: [
        Container(width: 1,height:63,color: Colors.black26,),
        SizedBox(width: 11,),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label),
              SizedBox(height: 8,),
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
                  onChanged: (v) => onChanged(v!),
                  buttonStyleData: ButtonStyleData(
                    width: double.infinity,
                    height: 40,
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
            ],
          ),
        ),
        SizedBox(width: 11,),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              SizedBox(height: 8,),
              GestureDetector(
                onTap: () => _showColorDialog(color, colorOnChanged),
                child: CircleAvatar(backgroundColor: color),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _label(
      String label,
      ){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  Widget _slider(
      String label,
      double value,
      double min,
      double max,
      ValueChanged<double> onChanged,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label : ${value.toInt()}",style: const TextStyle(fontWeight: FontWeight.w500)),
        Slider(
          value: value,
          min: min,
          max: max,
          activeColor: AppColors.primary,
          onChanged: onChanged,
        ),
      ],
    );
  }
  Widget _segmented({
    required List<String> items,
    ValueChanged<int>? onChanged,
  }) {
    int selectedIndex = 0;

    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          children: List.generate(items.length, (index) {
            final bool isSelected = index == selectedIndex;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                  onChanged?.call(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 35,
                  margin: EdgeInsets.only(left:index == 0 ? 0 : 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : const Color(0xFFE4E4E4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    items[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                      isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }


  Widget _colorPicker(
      String title,
      Color color,
      ValueChanged<Color> onChanged,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 8,),
        GestureDetector(
          onTap: () => _showColorDialog(color, onChanged),
          child: CircleAvatar(backgroundColor: color),
        ),
      ],
    );
  }

  void _showColorDialog(Color color, ValueChanged<Color> onChanged) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Pick Color"),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: color,
            onColorChanged: onChanged,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Done"))
        ],
      ),
    );
  }
}
