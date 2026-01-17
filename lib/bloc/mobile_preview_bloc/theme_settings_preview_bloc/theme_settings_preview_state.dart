abstract class ThemeSettingsPreviewState {}
class ThemeSettingsPreviewInitialState extends ThemeSettingsPreviewState{}
class ThemeSettingsPreviewLoadingState extends ThemeSettingsPreviewState{}
class ThemeSettingsPreviewLoadedState extends ThemeSettingsPreviewState{}
class ThemeSettingsPreviewErrorState extends ThemeSettingsPreviewState{
  String errorMsg;
  ThemeSettingsPreviewErrorState(this.errorMsg);
}