import 'package:flutter/material.dart';

/// Extension theme
extension ThemeExtension on BuildContext {
  /// Current [ThemeData] in your widget
  ThemeData get theme => Theme.of(this);
}
