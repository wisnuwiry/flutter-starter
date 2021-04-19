import 'package:equatable/equatable.dart';
import 'package:flutter_works/core/core.dart';

class Settings extends Equatable {
  Settings({
    required this.language,
    required this.theme,
  });

  final Language? language;
  final AppTheme? theme;

  @override
  List<Object?> get props => [language, theme];
}
