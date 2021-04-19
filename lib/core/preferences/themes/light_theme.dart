import 'package:flutter/material.dart';

class LightTheme {
  LightTheme(this.primaryColor);

  final Color primaryColor;

  ThemeData get toTheme {
    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
    );
  }
}
