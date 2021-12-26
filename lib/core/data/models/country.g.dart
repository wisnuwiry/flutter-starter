// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      dialCode: StringParser.parse(json['dial_code']),
      code: StringParser.parse(json['code']),
      flag: StringParser.parse(json['flag']),
      name: StringParser.parse(json['name']),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'dial_code': instance.dialCode,
      'code': instance.code,
      'flag': instance.flag,
      'name': instance.name,
    };
