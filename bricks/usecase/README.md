# UseCase 

A brick to create a usecase of the feature module.

## How to use 🚀

```
mason make usecase --name Login -o ./lib/features/auth/domain/usecases/
```

## Variables ✨

| Variable           | Description                     | Default | Type      | Conditional | 
| ------------------ | ------------------------------- | ------- | --------- | ----------- | 
| `name`             | The name of the page            | login   | `string`  | false       | 
| `type`             | Type of the usecase             | Future  | `enum`    | true        | 

## Outputs 📦


```
mason make usecase
└── login_usecase.dart
```