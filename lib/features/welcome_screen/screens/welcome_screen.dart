import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/shared/background_image_widget.dart';
import 'package:kroenchen_app/features/shared/my_individual_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        body: SafeArea(
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
                      "Kroenchen",
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
        ),
      ),
    );
  }
}
