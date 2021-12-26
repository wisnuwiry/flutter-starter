import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/core/core.dart';

class DarkTheme {
  DarkTheme(this.primaryColor);

  final Color primaryColor;
  static const Color dividerColor = Color(0xFF36393e);

  AppBarTheme get appBar => AppBarTheme(
        elevation: 0,
        color: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      );

  ButtonThemeData get button => ButtonThemeData(
        buttonColor: primaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dp12,
          horizontal: Dimens.dp24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
      );

  ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dp8),
          ),
          primary: primaryColor,
          onPrimary: Colors.white,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.dp12,
            horizontal: Dimens.dp24,
          ),
          elevation: 0,
        ),
      );

  InputDecorationTheme get inputDecoration {
    final baseBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: dividerColor),
      borderRadius: BorderRadius.circular(Dimens.dp8),
    );

    return InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Dimens.dp12,
        horizontal: Dimens.dp16,
      ),
      enabledBorder: baseBorder,
      disabledBorder: baseBorder,
      border: baseBorder,
      focusedBorder:
          baseBorder.copyWith(borderSide: BorderSide(color: primaryColor)),
      focusedErrorBorder:
          baseBorder.copyWith(borderSide: const BorderSide(color: Colors.red)),
      errorBorder:
          baseBorder.copyWith(borderSide: const BorderSide(color: Colors.red)),
    );
  }

  ThemeData get toTheme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      appBarTheme: appBar,
      buttonTheme: button,
      elevatedButtonTheme: elevatedButton,
      inputDecorationTheme: inputDecoration,
      dividerColor: dividerColor,
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            primary: primaryColor,
          ),
    );
  }
}
