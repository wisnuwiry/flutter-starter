import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{name.snakeCase()}}.g.dart';

@JsonSerializable()
class {{name.pascalCase()}} extends Equatable {
  const {{name.pascalCase()}}({
    required this.name,
  });

  factory {{name.pascalCase()}}.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}FromJson(json);

  @JsonKey(fromJson: StringParser.parse)
  final String name;

  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ToJson(this);

  @override
  List<Object?> get props => [name];
}
