import '../../../models/theme_settings_model.dart';

abstract class ThemeSettingsState {}

class ThemeSettingsInitialState extends ThemeSettingsState {}
class ThemeSettingsLoadingState extends ThemeSettingsState {}
class ThemeSettingsLoadedState extends ThemeSettingsState {
  ThemeSettingsData themeSettingsData;
  ThemeSettingsLoadedState(this.themeSettingsData);
}
class ThemeSettingsErrorState extends ThemeSettingsState {
  String errorMsg;
  ThemeSettingsErrorState(this.errorMsg);
}
