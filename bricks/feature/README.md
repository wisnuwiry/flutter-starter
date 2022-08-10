# Feature Brick

A brick to create a feature module using best practices.

## How to use 🚀

```
mason make feature --feature_name Auth -o ./lib/features
```

## Variables ✨

| Variable           | Description                     | Default | Type      | Conditional | When             |
| ------------------ | ------------------------------- | ------- | --------- | ----------- | ---------------- |
| `feature_name`     | The name of the feature         | login   | `string`  | false       | N/A              |


## Outputs 📦

```
--feature Auth
├── auth
│   ├── domain
│   │   ├── entities
│   │   │   └── entities.dart
|   │   ├── repositories
│   │   │   └── repositories.dart
|   │   ├── usecases
│   │   │   └── usecases.dart
│   │   └── domain.dart
│   ├── presentation
|   │   ├── blocs
│   │   │   └── blocs.dart
|   │   ├── pages
│   │   │   └── pages.dart
│   │   └── presentation.dart
│   └── auth.dart
└── ...
```