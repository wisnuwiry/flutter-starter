import 'package:equatable/equatable.dart';

class Language extends Equatable {
  const Language({
    required this.code,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> map) {
    return Language(
      code: map['code'],
      name: map['name'],
    );
  }

  final String code;
  final String name;

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [code, name];
}
