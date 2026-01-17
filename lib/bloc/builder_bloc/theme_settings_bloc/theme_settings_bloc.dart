import 'package:builder/bloc/builder_bloc/theme_settings_bloc/theme_settings_event.dart';
import 'package:builder/bloc/builder_bloc/theme_settings_bloc/theme_settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilites/repository.dart';

class ThemeSettingsBloc extends Bloc<ThemeSettingsEvent, ThemeSettingsState> {

  final BuilderRepository repository;
  ThemeSettingsBloc(this.repository) : super(ThemeSettingsInitialState()) {
    on<ThemeSettingsEvent>(_load);
  }
    Future<void> _load(
        ThemeSettingsEvent event,
        Emitter<ThemeSettingsState> emit,
        ) async {
      emit(ThemeSettingsLoadingState());
      try {
        final data = await repository.loadBuilderData();
        emit(ThemeSettingsLoadedState(data));
      } catch (e) {
        emit(ThemeSettingsErrorState(e.toString()));
      }
  }
}