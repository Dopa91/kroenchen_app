import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

final ThemeData darkTheme = ThemeData(
  fontFamily: "Outfit",

  // ✅ Verbesserte Textfarben
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
      fontFamily: "Outfit",
      color: brighterPurple, // Harmonischer mit dem Hintergrund
    ),
    headlineMedium: TextStyle(
      fontSize: 42,
      fontFamily: "Outfit",
      color: generalWhite, // Weiß für starke Kontraste
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: "Outfit",
      color: generalWhite,
    ),
  ),

  // ✅ Icons jetzt dunkler und kontrastreicher
  iconTheme: IconThemeData(color: brighterPurple),

  // ✅ Dark Mode Farben
  brightness: Brightness.dark,

  // ✅ Navigation Bar dunkler & harmonisch abgestimmt
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: darkerBackgroundColorPurple, // Passend zum Hintergrund
    backgroundColor: darkerBackgroundColorPurple,
  ),

  // ✅ Hintergrund bleibt transparent für dein Background Widget
  scaffoldBackgroundColor: Colors.transparent,

  // ✅ Buttons dunkler & mit besserem Kontrast
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:
          darkerButtonBlue, // Dunkleres Blau für stärkeren Kontrast
      foregroundColor: generalWhite, // Weißer Text
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),

  // ✅ Cards mit angepasstem Dunkelton
  cardTheme: CardTheme(
    color: darkerBrighterPurple, // Etwas heller, aber noch dark mode-friendly
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  // ✅ Dialoge dunkler & besser integriert
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
