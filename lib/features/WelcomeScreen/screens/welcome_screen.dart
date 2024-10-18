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
                "Herzlich Willkommen",
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
                nextSite: () => Navigator.pushNamed(context, "/loginscreen"),
                icon: Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
