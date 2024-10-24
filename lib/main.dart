import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/themes.dart';
import 'package:kroenchen_app/features/Homepage/screens/bottom_Navigation_bar_main.dart';
import 'package:kroenchen_app/features/Login/screens/loginpage.dart';
import 'package:kroenchen_app/features/SignUp/screens/register_screen.dart';
import 'package:kroenchen_app/features/SignUp/screens/register_screen_finish.dart';
import 'package:kroenchen_app/features/SignUp/screens/register_screen_three.dart';
import 'package:kroenchen_app/features/SignUp/screens/register_screen_two.dart';
import 'package:kroenchen_app/features/WelcomeScreen/screens/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.system,
      themeMode: isSwitched ? ThemeMode.light : ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const WelcomeScreen(),
      routes: {
        '/loginscreen': (context) => const LoginScreen(),
        '/registerscreenstart': (context) => const RegisterScreenStart(),
        '/registerscreentwo': (context) => const RegisterScreenTwo(),
        '/registerscreenthree': (context) => const RegisterScreenThree(),
        '/registerscreenfinish': (context) => const RegisterScreenFinish(),
        '/bottomnavigationbarmain': (context) => BottomNavigationBarMain(
              isSwitched: isSwitched,
              onChanged: (bool newValue) {
                setState(() {
                  isSwitched = newValue;
                });
              },
            ),
      },
    );
  }
}
