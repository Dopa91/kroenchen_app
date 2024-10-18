import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
              Image.asset(
                "assets/images/k_logo.png",
                height: 512,
              ),
              const Text(
                "Herzlich Willkommen",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32),
              MyIndividualButton(
                newText: 'Reise Starten',
                nextSite: () => Navigator.pushNamed(context, "/loginscreen"),
                icon: Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
