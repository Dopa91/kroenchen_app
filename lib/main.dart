import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/themes.dart';
import 'package:kroenchen_app/features/login/screens/loginpage.dart';
// import 'package:kroenchen_app/features/welcome_screen/screens/welcome_screen.dart';
import 'package:kroenchen_app/features/mainscreen/screens/bottom_navigation_bar_main.dart';
import 'package:kroenchen_app/features/sign_up/screens/register_screen.dart';
import 'package:kroenchen_app/features/sign_up/screens/register_screen_finish.dart';
import 'package:kroenchen_app/features/sign_up/screens/register_screen_three.dart';
import 'package:kroenchen_app/features/sign_up/screens/register_screen_two.dart';
import 'package:kroenchen_app/shared/repository/database_repository.dart';
import 'package:kroenchen_app/shared/repository/mock_auth_repository.dart';
import 'package:kroenchen_app/shared/repository/shared_preferences_database.dart';
import 'package:kroenchen_app/shared/repository/firebase_auth_repository.dart';
import 'package:kroenchen_app/shared/repository/auth_repository.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main({bool useMock = false}) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!useMock) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>(
          create: (_) => SharedPreferencesDatabase(),
        ),
        Provider<AuthRepository>(
          create: (_) =>
              useMock ? MockAuthRepository() : FirebaseAuthRepository(),
        ),
      ],
      child: const MainApp(),
    ),
  );
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
    final authRepo = Provider.of<AuthRepository>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isSwitched ? ThemeMode.light : ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: StreamBuilder(
        stream: authRepo.authStateChanges,
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (snapshot.connectionState == ConnectionState.active) {
            if (user == null) {
              return const LoginScreen();
            } else {
              return BottomNavigationBarMain(
                isSwitched: isSwitched,
                onChanged: (bool newValue) {
                  setState(() {
                    isSwitched = newValue;
                  });
                },
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      routes: {
        '/loginscreen': (context) => LoginScreen(),
        '/registerscreenstart': (context) => RegisterScreenStart(),
        '/registerscreentwo': (context) => RegisterScreenTwo(),
        '/registerscreenthree': (context) => RegisterScreenThree(),
        '/registerscreenfinish': (context) => RegisterScreenFinish(),
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
