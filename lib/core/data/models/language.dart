import 'package:equatable/equatable.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class Language extends Equatable {
  const Language({required this.code, required this.name});

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  @JsonKey(fromJson: StringParser.parse)
  final String code;

  @JsonKey(fromJson: StringParser.parse)
  final String name;

  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  Language copyWith({
    String? code,
    String? name,
  }) {
    return Language(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [code, name];
}
