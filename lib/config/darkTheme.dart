import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xffbd93f9),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xffbd93f9),
        secondary: Color(0xffff79c6),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Color(0xffbd93f9),
        titleTextStyle: TextStyle(
          color: Color(0xffbd93f9),
          fontFamily: "VazirLight",
          fontSize: 20,
        ),
        backgroundColor: Color(0xff282a36),
        elevation: 1.0,
        centerTitle: true,
      ),
      cardColor: const Color(0xff44475a),
      scaffoldBackgroundColor: const Color(0xff282a36),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(const Color(0xffbd93f9)),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(
          const Color(0xffbd93f9),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xffbd93f9),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: Color(0xffbd93f9),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xff44475a),
      ));
}
