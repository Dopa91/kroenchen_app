import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/themes.dart';
import 'package:kroenchen_app/features/mainscreen/screens/bottom_navigation_bar_main.dart';
import 'package:kroenchen_app/features/login/screens/loginpage.dart';
import 'package:kroenchen_app/features/sign_up/screens/register_screen.dart';
import 'package:kroenchen_app/features/sign_up/screens/register_screen_finish.dart';
import 'package:kroenchen_app/features/sign_up/screens/register_screen_three.dart';
import 'package:kroenchen_app/features/sign_up/screens/register_screen_two.dart';
import 'package:kroenchen_app/features/welcome_screen/screens/welcome_screen.dart';
import 'package:kroenchen_app/firebase_options.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
// import 'package:kroenchen_app/shared/repository/mock_database.dart';
import 'package:kroenchen_app/shared/repository/shared_preferences_database.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    Provider<DatabaseRepository>(
      create: (_) => SharedPreferencesDatabase(),
    )
  ], child: const MainApp()));
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
