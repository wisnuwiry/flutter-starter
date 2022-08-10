import 'package:equatable/equatable.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(fromJson: StringParser.parse)
  final String name;

  @JsonKey(fromJson: StringParser.parse)
  final String email;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [name, email];
}
