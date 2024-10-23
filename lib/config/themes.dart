import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

final ThemeData darkTheme = ThemeData(
    fontFamily: "Outfit",
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        fontFamily: "Outfit",
        color: brighterPurple,
      ),
      headlineMedium: TextStyle(
        fontSize: 42,
        fontFamily: "Outfit",
        color: brighterPurple,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontFamily: "Outfit",
        color: brighterPurple,
      ),
    ),
    navigationBarTheme:
        NavigationBarThemeData(backgroundColor: darkerBrighterPurple),
    scaffoldBackgroundColor: darkerBackgroundColorPurple);

final ThemeData lightTheme = ThemeData(
  fontFamily: "Outfit",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
      fontFamily: "Outfit",
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 42,
      fontFamily: "Outfit",
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: "Outfit",
      color: Colors.white,
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(backgroundColor: brighterPurple),
  scaffoldBackgroundColor: backgroundColorPurple,
);
