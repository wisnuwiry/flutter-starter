import 'package:equatable/equatable.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country extends Equatable {
  const Country({
    required this.dialCode,
    required this.code,
    required this.flag,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  @JsonKey(name: 'dial_code', fromJson: StringParser.parse)
  final String dialCode;

  @JsonKey(fromJson: StringParser.parse)
  final String code;

  @JsonKey(fromJson: StringParser.parse)
  final String flag;

  @JsonKey(fromJson: StringParser.parse)
  final String name;

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  Country copyWith({
    String? dialCode,
    String? code,
    String? flag,
    String? name,
  }) {
    return Country(
      dialCode: dialCode ?? this.dialCode,
      code: code ?? this.code,
      flag: flag ?? this.flag,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [dialCode, code, flag, name];
}
