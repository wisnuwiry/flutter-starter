import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';

class Settings extends Equatable {
  const Settings({
    required this.language,
    required this.theme,
  });

  final Language? language;
  final AppTheme? theme;

  @override
  List<Object?> get props => [language, theme];
}
