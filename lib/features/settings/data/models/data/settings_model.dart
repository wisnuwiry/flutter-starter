import '../../../../../app/config.dart';
import '../../../../../core/core.dart';
import '../../../settings.dart';

class SettingsModel extends Settings {
  const SettingsModel({required AppTheme? theme, required Language? language})
      : super(theme: theme, language: language);

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      theme: appThemeFromString(json['theme']) ?? AppConfig.defaultTheme,
      language:
          json['language'] != null ? Language.fromJson(json['language']) : null,
    );
  }

  SettingsModel copyWith({
    Language? language,
    AppTheme? theme,
  }) {
    return SettingsModel(
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }
}

extension SettingsModelX on Settings {
  Map<String, dynamic> toJson() {
    return {
      'theme': theme?.toText(),
      'language': language?.toJson(),
    };
  }

  SettingsModel toModel() {
    return SettingsModel(
      theme: theme,
      language: language,
    );
  }
}
