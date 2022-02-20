import 'package:flutter/material.dart';

abstract class BaseTheme {
  ColorScheme get scheme;

  AppBarTheme get appBar;

  ButtonThemeData get button;

  ElevatedButtonThemeData get elevatedButton;

  OutlinedButtonThemeData get outlinedButton;

  CardTheme get card;

  InputDecorationTheme get inputDecoration;

  ThemeData get data;
}
