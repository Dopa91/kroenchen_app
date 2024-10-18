import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Outfit",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 21),
    headlineMedium: TextStyle(fontSize: 30),
    bodySmall: TextStyle(fontSize: 16),
  ),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: "Outfit",
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 21),
    headlineMedium: TextStyle(fontSize: 42),
    bodySmall: TextStyle(fontSize: 14),
  ),
);
