import 'package:flutter/material.dart';

Color brighterPurple = const Color.fromARGB(255, 217, 192, 242);
Color darkerBrighterPurple = const Color.fromARGB(255, 194, 151, 237);

Color buttonBlue = const Color.fromARGB(255, 16, 98, 219);
Color darkerButtonBlue = const Color.fromARGB(255, 8, 52, 117);
Color brighterButtonBlue = const Color.fromARGB(255, 116, 145, 230);

Color generalWhite = Color.fromARGB(255, 222, 226, 233);

Color darkerBackgroundColorPurple = const Color.fromARGB(255, 75, 0, 150);
Color backgroundColorPurple = const Color.fromARGB(255, 160, 81, 238);

Color moon = const Color.fromARGB(255, 255, 255, 147);
Color sun = const Color.fromARGB(255, 255, 174, 67);

LinearGradient backgroundColorPurpleGradient = LinearGradient(
  begin: Alignment(0.39, -0.92),
  end: Alignment(-0.39, 0.92),
  colors: [
    Color.fromARGB(255, 217, 192, 242),
    Color.fromARGB(255, 194, 151, 237),
    Color.fromARGB(255, 160, 81, 238),
    Color.fromARGB(255, 16, 98, 219),
  ],
);

LinearGradient daerkerBackgroundColorPurpleGradient = LinearGradient(
  begin: Alignment(0.39, -0.92),
  end: Alignment(-0.39, 0.92),
  colors: [
    Color.fromARGB(255, 193, 130, 255),
    Color.fromARGB(255, 184, 124, 244),
    Color.fromARGB(255, 88, 25, 150),
    Color.fromARGB(255, 0, 38, 94),
  ],
);
