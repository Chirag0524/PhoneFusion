import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
      primarySwatch: Colors.purple,
      primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
      colorScheme: isDarkTheme
          ? ColorScheme.dark(
        primary: Colors.purple,
        secondary: Colors.deepPurple,
        background: Colors.black,
        surface: Colors.grey.shade700,
        onBackground: Colors.white,
        onSurface: Colors.white,
      )
          : const ColorScheme.light(
        primary: Colors.purple,
        secondary: Colors.deepPurple,
        background: Colors.white,
        surface: Colors.white,
        onBackground: Colors.black,
        onSurface: Colors.black,
      ),
      indicatorColor: isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      highlightColor: isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
      hoverColor: isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor: isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: isDarkTheme ? Colors.white : Colors.black,
      ),
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
