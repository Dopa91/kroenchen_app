import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/themes.dart';
import 'package:kroenchen_app/features/Login/screens/loginpage.dart';
import 'package:kroenchen_app/features/WelcomeScreen/screens/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: const WelcomeScreen(),
      routes: {
        '/loginscreen': (context) => const LoginScreen(),
        // '/registerscreenstart': (context) => const RegisterScreenStart(),
      },
    );
  }
}
