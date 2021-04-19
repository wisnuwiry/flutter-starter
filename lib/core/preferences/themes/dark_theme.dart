import 'package:flutter/material.dart';

class DarkTheme {
  DarkTheme(this.primaryColor);

  final Color primaryColor;

  ThemeData get toTheme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
    );
  }
}
