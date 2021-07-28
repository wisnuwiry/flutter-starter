import 'package:equatable/equatable.dart';

class Country extends Equatable {
  const Country({
    required this.dialCode,
    required this.code,
    required this.flag,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> map) {
    return Country(
      dialCode: map['dial_code'],
      code: map['code'],
      flag: map['flag'],
      name: map['name'],
    );
  }

  final String dialCode;
  final String code;
  final String flag;
  final String name;

  Map<String, dynamic> toJson() {
    return {
      'dial_code': dialCode,
      'code': code,
      'flag': flag,
      'name': name,
    };
  }

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
