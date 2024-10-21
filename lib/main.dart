import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/themes.dart';
import 'package:kroenchen_app/features/Homepage/screens/bottom_Navigation_bar_screen.dart';
import 'package:kroenchen_app/features/Login/screens/loginpage.dart';
import 'package:kroenchen_app/features/SignUp/screens/register_screen.dart';
import 'package:kroenchen_app/features/SignUp/screens/register_screen_finish.dart';
import 'package:kroenchen_app/features/SignUp/screens/register_screen_three.dart';
import 'package:kroenchen_app/features/SignUp/screens/register_screen_two.dart';
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
        '/registerscreenstart': (context) => const RegisterScreenStart(),
        '/registerscreentwo': (context) => const RegisterScreenTwo(),
        '/registerscreenthree': (context) => const RegisterScreenThree(),
        '/registerscreenfinish': (context) => const RegisterScreenFinish(),
        '/homepage': (context) => const BottomNavigationBarMain(),
      },
    );
  }
}
