import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/themes.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Kroenchen",
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: Image.asset(
                  "assets/images/k_logo.png",
                  height: 512,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Herzliche Willkommen",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: MyIndividualButton(
                  newText: 'Reise Starten',
                  nextSite: () => Navigator.pushNamed(context, "/loginpage"),
                  icon: Icons.arrow_forward,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
