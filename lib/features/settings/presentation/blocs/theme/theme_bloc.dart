import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_starter/app/config.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required this.getThemeSetting,
    required this.saveThemeSetting,
  }) : super(const ThemeState(AppConfig.defaultTheme)) {
    on<ThemeStarted>(_onThemeStarted);
    on<ThemeChanged>(_onThemeChanged);
  }

  final GetThemeSettingUseCase getThemeSetting;
  final SaveThemeSettingUseCase saveThemeSetting;

  Future _onThemeStarted(ThemeStarted event, Emitter<ThemeState> emit) async {
    try {
      final savedData = await getThemeSetting(const NoParams());

      emit(
        savedData.fold(
          (failure) => state,
          ThemeState.new,
        ),
      );
    } catch (exception, stackTrace) {
      exception.recordError(
        RecordErrorParams(exception: exception, stackTrace: stackTrace),
      );
    }
  }

  Future _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    try {
      final result = await saveThemeSetting(event.theme);

      if (result.isRight()) {
        add(const ThemeStarted());
      }
    } catch (exception, stackTrace) {
      exception.recordError(
        RecordErrorParams(exception: exception, stackTrace: stackTrace),
      );
    }
  }
}
