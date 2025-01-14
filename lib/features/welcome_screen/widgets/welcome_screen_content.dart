import 'package:flutter/material.dart';
import 'package:kroenchen_app/shared/widgets/my_individual_button.dart';

class WelcomeScreenContent extends StatelessWidget {
  const WelcomeScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            Expanded(child: const SizedBox(height: 32)),
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
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
