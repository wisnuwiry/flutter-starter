# Repository 

A brick to create a new Repository of the feature module.

## How to use 🚀

```
mason make repository --name User -o ./lib/features/auth/domain/repositories/
```

## Variables ✨

| Variable           | Description                     | Default | Type      | Conditional | 
| ------------------ | ------------------------------- | ------- | --------- | ----------- | 
| `name`             | The name of the repository      | Dash    | `string`  | false       | 
| `handler`          | Handler type of repository      | network | `enum`    | true        | 

## Outputs 📦


```
mason make repository --name User -o ./lib/features/auth/domain/repositories/
└── user_repository.dart
```