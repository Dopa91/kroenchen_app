import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Roboto",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
      fontFamily: "Outfit",
    ),
    headlineMedium: TextStyle(
      fontSize: 42,
      fontFamily: "Outfit",
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: "Outfit",
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
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
);
