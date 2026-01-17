class ThemeSettingsData {
  ThemeSettingsData({
    required this.status,
    required this.message,
    required this.themeSettings,
  });

  final bool? status;
  final String? message;
  final List<ThemeSetting> themeSettings;

  factory ThemeSettingsData.fromJson(Map<String, dynamic> json){
    return ThemeSettingsData(
      status: json["status"],
      message: json["message"],
      themeSettings: json["theme_settings"] == null ? [] : List<ThemeSetting>.from(json["theme_settings"]!.map((x) => ThemeSetting.fromJson(x))),
    );
  }

}

class ThemeSetting {
  ThemeSetting({
    required this.appStyling,
    required this.productBlock,
  });

  final AppStyling? appStyling;
  final ProductBlock? productBlock;

  factory ThemeSetting.fromJson(Map<String, dynamic> json){
    return ThemeSetting(
      appStyling: json["app_styling"] == null ? null : AppStyling.fromJson(json["app_styling"]),
      productBlock: json["product_block"] == null ? null : ProductBlock.fromJson(json["product_block"]),
    );
  }
}

class AppStyling {
  AppStyling({
    required this.fontFamily,
    required this.bottomBarStyle,
    required this.styleItems,
    required this.iconStyle,
  });

  final List<String> fontFamily;
  final String? bottomBarStyle;
  final List<String> styleItems;
  final List<String> iconStyle;

  factory AppStyling.fromJson(Map<String, dynamic> json){
    return AppStyling(
      fontFamily: json["font_family"] == null ? [] : List<String>.from(json["font_family"]!.map((x) => x)),
      bottomBarStyle: json["bottom_bar_style"],
      styleItems: json["style_items"] == null ? [] : List<String>.from(json["style_items"]!.map((x) => x)),
      iconStyle: json["icon_style"] == null ? [] : List<String>.from(json["icon_style"]!.map((x) => x)),
    );
  }

}

class ProductBlock {
  ProductBlock({
    required this.imageAspectRatio,
    required this.imagePosition,
    required this.sellingPriceFontStyle,
    required this.discountValueSize,
    required this.titleTextBehavior,
    required this.titleTextAlignment,
  });

  final List<String> imageAspectRatio;
  final List<String> imagePosition;
  final List<String> sellingPriceFontStyle;
  final List<String> discountValueSize;
  final List<String> titleTextBehavior;
  final List<String> titleTextAlignment;

  factory ProductBlock.fromJson(Map<String, dynamic> json){
    return ProductBlock(
      imageAspectRatio: json["image_aspect_ratio"] == null ? [] : List<String>.from(json["image_aspect_ratio"]!.map((x) => x)),
      imagePosition: json["image_position"] == null ? [] : List<String>.from(json["image_position"]!.map((x) => x)),
      sellingPriceFontStyle: json["selling_price_font_style"] == null ? [] : List<String>.from(json["selling_price_font_style"]!.map((x) => x)),
      discountValueSize: json["discount_value_size"] == null ? [] : List<String>.from(json["discount_value_size"]!.map((x) => x)),
      titleTextBehavior: json["title_text_behavior"] == null ? [] : List<String>.from(json["title_text_behavior"]!.map((x) => x)),
      titleTextAlignment: json["title_text_alignment"] == null ? [] : List<String>.from(json["title_text_alignment"]!.map((x) => x)),
    );
  }

}
