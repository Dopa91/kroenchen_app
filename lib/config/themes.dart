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
  cardTheme: CardTheme(
    color: Colors.grey,
  ),
);

final ThemeData lightTheme = ThemeData(
  fontFamily: "Outfit",
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
      fontFamily: "Outfit",
      color: generalWhite,
    ),
    headlineMedium: TextStyle(
      fontSize: 42,
      fontFamily: "Outfit",
      color: generalWhite,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: "Outfit",
      color: generalWhite,
    ),
  ),
  iconTheme: IconThemeData(color: generalWhite),

  brightness: Brightness.light,
  // primaryColor: backgroundColorPurple,
  navigationBarTheme: NavigationBarThemeData(backgroundColor: brighterPurple),
  scaffoldBackgroundColor: Colors.transparent,
  // scaffoldBackgroundColor: backgroundColorPurple,
);
