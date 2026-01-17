import 'package:builder/bloc/mobile_preview_bloc/theme_settings_preview_bloc/theme_settings_preview_event.dart';
import 'package:builder/bloc/mobile_preview_bloc/theme_settings_preview_bloc/theme_settings_preview_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSettingsPreviewBloc extends Bloc<ThemeSettingsPreviewEvent, ThemeSettingsPreviewState>{
  ThemeSettingsPreviewBloc() : super(ThemeSettingsPreviewInitialState()){

  }
}
