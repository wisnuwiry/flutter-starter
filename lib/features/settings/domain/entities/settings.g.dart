// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
      theme: $enumDecodeNullable(_$AppThemeEnumMap, json['theme'],
              unknownValue: AppTheme.light) ??
          AppTheme.light,
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language?.toJson());
  writeNotNull('theme', _$AppThemeEnumMap[instance.theme]);
  return val;
}

const _$AppThemeEnumMap = {
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
};
