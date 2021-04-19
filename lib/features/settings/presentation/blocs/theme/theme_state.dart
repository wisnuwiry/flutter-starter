part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState(this.theme);

  final ThemeData theme;

  @override
  List<Object> get props => [theme];
}
