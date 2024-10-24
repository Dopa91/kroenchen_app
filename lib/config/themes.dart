import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

final ThemeData darkTheme = ThemeData(
  fontFamily: "Outfit",
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
      fontFamily: "Outfit",
      color: darkerBrighterPurple,
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
  iconTheme: IconThemeData(color: brighterPurple),
  brightness: Brightness.dark,
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: darkerBackgroundColorPurple,
    backgroundColor: darkerBrighterPurple,
  ),
  scaffoldBackgroundColor: Colors.transparent,
  // scaffoldBackgroundColor: darkerBackgroundColorPurple,
);

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
  iconTheme: IconThemeData(color: Colors.white),

  brightness: Brightness.light,
  // primaryColor: backgroundColorPurple,
  navigationBarTheme: NavigationBarThemeData(backgroundColor: brighterPurple),
  scaffoldBackgroundColor: Colors.transparent,
  // scaffoldBackgroundColor: backgroundColorPurple,
);
