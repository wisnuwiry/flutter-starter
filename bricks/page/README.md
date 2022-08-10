# Page 

A brick to create a page of the feature module.

## How to use 🚀

```
mason make page --name Login --useSection true -o ./lib/features/auth/presentation/pages/
```

## Variables ✨

| Variable           | Description                     | Default | Type      | Conditional | 
| ------------------ | ------------------------------- | ------- | --------- | ----------- | 
| `name`             | The name of the page            | login   | `string`  | false       | 
| `useSection`       | Use the section of the page     | true    | `boolean` | true        | 

## Outputs 📦


```
mason make name Login --useSection true
├── login
│   ├── sections
│   │   └── body_section.dart
│   └── page.dart
└── ...
```