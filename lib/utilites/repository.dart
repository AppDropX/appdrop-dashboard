import 'dart:convert';
import 'package:builder/models/theme_settings_model.dart';
import 'package:flutter/services.dart';


class BuilderRepository {
  /// 🔹 TEMP: load from local asset
  Future<ThemeSettingsData> loadBuilderData() async {
    final jsonStr = await rootBundle
        .loadString('assets/data/app_data.json');
    final jsonMap = jsonDecode(jsonStr);
    return ThemeSettingsData.fromJson(jsonMap);
  }

  /// 🔹 FUTURE: API method
  Future<ThemeSettingsData> fetchFromApi() async {
    // final response = await api.get(...)
    // return BuilderThemeResponse.fromJson(response);
    throw UnimplementedError();
  }
}

