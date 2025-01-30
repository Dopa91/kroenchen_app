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
      color: generalWhite,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: "Outfit",
      color: generalWhite,
    ),
  ),
  iconTheme: IconThemeData(color: brighterPurple),
  brightness: Brightness.dark,
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: darkerBackgroundColorPurple,
    backgroundColor: darkerBackgroundColorPurple,
  ),
  scaffoldBackgroundColor: Colors.transparent,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkerButtonBlue,
      foregroundColor: generalWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  cardTheme: CardTheme(
    color: generalWhite,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: darkerBackgroundColorPurple,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: generalWhite,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16,
      color: generalWhite,
    ),
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
  navigationBarTheme: NavigationBarThemeData(backgroundColor: brighterPurple),
  scaffoldBackgroundColor: Colors.transparent,
  dialogTheme: DialogTheme(
    backgroundColor: generalWhite,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: darkerBackgroundColorPurple,
    ),
    contentTextStyle: TextStyle(
      fontSize: 16,
      color: darkerBackgroundColorPurple,
    ),
  ),
);
