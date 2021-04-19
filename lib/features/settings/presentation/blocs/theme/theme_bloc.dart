import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../app/config.dart';
import '../../../../../core/core.dart';
import '../../../settings.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required this.getThemeSetting,
    required this.saveThemeSetting,
  }) : super(ThemeState(AppConfig.defaultTheme.toThemeData()));

  final GetThemeSettingUseCase getThemeSetting;
  final SaveThemeSettingUseCase saveThemeSetting;

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is InitializeThemeEvent) {
      final savedData = await getThemeSetting(NoParams());

      yield* savedData.fold((failure) async* {}, (data) async* {
        yield ThemeState(data.toThemeData());
      });
    } else if (event is ChangeThemeEvent) {
      final result = await saveThemeSetting(event.theme);

      if (result.isRight()) {
        add(InitializeThemeEvent());
      }
    }
  }
}
