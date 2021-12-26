part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeStarted extends ThemeEvent {
  const ThemeStarted();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  const ThemeChanged(this.theme);

  final AppTheme theme;

  @override
  List<Object> get props => [theme];
}
