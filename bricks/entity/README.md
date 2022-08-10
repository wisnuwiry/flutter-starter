# Entity

A brick to create your entity with properties and all the supporting methods.

This brick supports custom types and custom lists!

## How to use 🚀

```
mason make entity --name user -o ./lib/features/auth/domain/entities/
```

## Variables ✨

| Variable         | Description                      | Default | Type      |
| ---------------- | -------------------------------- | ------- | --------- |
| `name`     | The name of the entity            | entity   | `string`  |

## Outputs 📦

```
mason make entity --name user -o ./lib/features/auth/domain/entities/
└── user.dart
```

```dart
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  @JsonKey(fromJson: StringParser.parse)
  final String name;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [name];
}
```